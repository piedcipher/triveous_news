import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:triveous_news/blocs/news/news_bloc.dart';
import 'package:triveous_news/blocs/news/news_event.dart';
import 'package:triveous_news/blocs/news/news_state.dart';
import 'package:triveous_news/utils/constants.dart';

class NewsBody extends StatefulWidget {
  final NewsCategory newsCategory;
  final NewsBloc newsBloc;

  NewsBody(this.newsCategory, this.newsBloc);

  @override
  _NewsBodyState createState() => _NewsBodyState();
}

class _NewsBodyState extends State<NewsBody> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    if (!widget.newsBloc.initialRender)
      widget.newsBloc.add(NewsFetchEvent(widget.newsCategory));
    widget.newsBloc.initialRender = true;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<NewsBloc, NewsState>(
        cubit: widget.newsBloc,
        listener: (context, state) {
          if (state is NewsLoadingState) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('Loading')));
          } else if (state is NewsSuccessState && state.result.isEmpty) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: const Text('No News')));
          } else if (state is NewsErrorState) {
            Scaffold.of(context).showSnackBar(SnackBar(content: Text('Error')));
            widget.newsBloc.isFetching = false;
          }
          return;
        },
        builder: (context, state) {
          if (state is NewsInitialState ||
              state is NewsLoadingState && widget.newsBloc.newsModel.isEmpty) {
            return CircularProgressIndicator();
          } else if (state is NewsSuccessState) {
            Scaffold.of(context).hideCurrentSnackBar();
            widget.newsBloc.newsModel.addAll(state.result);
            widget.newsBloc.isFetching = false;
          } else if (state is NewsErrorState &&
              widget.newsBloc.newsModel.isEmpty) {
            return Text('Error');
          }
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 30,
            ),
            padding: EdgeInsets.all(16),
            controller: scrollController
              ..addListener(() {
                if (scrollController.offset ==
                        scrollController.position.maxScrollExtent &&
                    !widget.newsBloc.isFetching) {
                  widget.newsBloc.isFetching = true;
                  widget.newsBloc.add(NewsFetchEvent(widget.newsCategory));
                }
              }),
            itemBuilder: (context, index) {
              return Card(
                elevation: 1,
                child: ListTile(
                  title: widget.newsBloc.newsModel[index]?.fields?.thumbnail !=
                          null
                      ? Image.network(
                          widget.newsBloc.newsModel[index].fields.thumbnail)
                      : Container(),
                  subtitle: Center(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      child: Text(
                        widget.newsBloc.newsModel[index].webTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: widget.newsBloc.newsModel.length,
          );
        },
      ),
    );
  }
}

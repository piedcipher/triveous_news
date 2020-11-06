import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:triveous_news/blocs/news/news_event.dart';
import 'package:triveous_news/blocs/news/news_state.dart';
import 'package:http/http.dart' as http;
import 'package:triveous_news/models/news_model.dart';
import 'package:triveous_news/utils/constants.dart';
import 'package:triveous_news/utils/extensions.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  bool initialRender = false;
  bool isFetching = false;
  int page = 1;
  final List<NewsModel> newsModel = [];

  NewsBloc() : super(NewsInitialState());

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is NewsFetchEvent) {
      yield NewsLoadingState();
      try {
        final response = await http.get(
            'https://content.guardianapis.com/search?api-key=$kApiKey&section=${event.newsCategory.newsCategory(needLowerCase: true)}&page=$page&show-fields=thumbnail');
        if (response is http.Response) {
          if (response.statusCode == 200) {
            final newsItems =
                (jsonDecode(response.body)['response']['results'] as List)
                    .map((e) => NewsModel.fromJson(e))
                    .toList();
            page++;
            yield NewsSuccessState(newsItems);
          } else {
            yield NewsErrorState(response.body);
          }
        }
      } catch (e) {
        yield NewsErrorState(e.toString());
      }
    }
  }
}

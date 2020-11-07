import 'package:flutter/material.dart';
import 'package:triveous_news/blocs/news/news_bloc.dart';
import 'package:triveous_news/pages/news/widgets/news_body.dart';
import 'package:triveous_news/utils/constants.dart';
import 'package:triveous_news/utils/extensions.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  TabController tabController;
  final Map<NewsCategory, NewsBloc> newsBlocs = {
    NewsCategory.business: NewsBloc(),
    NewsCategory.education: NewsBloc(),
    NewsCategory.environment: NewsBloc(),
    NewsCategory.food: NewsBloc(),
    NewsCategory.games: NewsBloc(),
    NewsCategory.politics: NewsBloc(),
    NewsCategory.society: NewsBloc(),
    NewsCategory.technology: NewsBloc(),
    NewsCategory.travel: NewsBloc(),
    NewsCategory.world: NewsBloc(),
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: kNewsTabCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text('News'),
          bottom: TabBar(
            onTap: (_) => false,
            isScrollable: true,
            tabs: NewsCategory.values
                .map((e) => Tab(child: Text(e.newsCategory())))
                .toList(),
            controller: DefaultTabController.of(context),
          ),
        ),
        body: TabBarView(
          controller: DefaultTabController.of(context),
          children: NewsCategory.values
              .map(
                (e) => Container(child: NewsBody(e, newsBlocs[e])),
              )
              .toList(),
        ),
      ),
    );
  }
}

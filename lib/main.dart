import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:triveous_news/pages/details/details_page.dart';
import 'package:triveous_news/pages/news/news_page.dart';
import 'package:triveous_news/utils/bloc_observer.dart';
import 'package:triveous_news/utils/routes.dart';

void main() {
  Bloc.observer = TriveousNewsBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      initialRoute: Routes.kNews,
      theme: ThemeData.dark(),
      routes: {
        Routes.kNews: (context) => NewsPage(),
        Routes.kDetails: (context) => DetailsPage(),
      },
    );
  }
}

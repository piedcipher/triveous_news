import 'package:triveous_news/utils/constants.dart';

abstract class NewsEvent {
  const NewsEvent();
}

class NewsFetchEvent extends NewsEvent {
  final NewsCategory newsCategory;
  const NewsFetchEvent(this.newsCategory);
}

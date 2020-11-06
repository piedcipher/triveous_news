import 'package:triveous_news/models/news_model.dart';

abstract class NewsState {
  const NewsState();
}

class NewsInitialState extends NewsState {
  const NewsInitialState();
}

class NewsLoadingState extends NewsState {
  const NewsLoadingState();
}

class NewsSuccessState extends NewsState {
  final List<NewsModel> result;
  const NewsSuccessState(this.result);
}

class NewsErrorState extends NewsState {
  final String error;
  const NewsErrorState(this.error);
}

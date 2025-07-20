import '../../core/model/top_headline_model.dart';

abstract class NewsState {}
class NewsInitial extends NewsState {}
class NewsLoading extends NewsState {}
class NewsSuccessed extends NewsState {
  final TopHeadLinesModel topHeadLinesModel;
  NewsSuccessed(this.topHeadLinesModel);
}
class NewsError extends NewsState {
  final String error;
  NewsError(this.error);
}

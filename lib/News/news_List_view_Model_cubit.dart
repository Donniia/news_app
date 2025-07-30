import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/RepositoryContract/news_repo.dart';
import '../DataLayer/Model/NewsResponse/news.dart';

@injectable
class NewsListViewModelBloc extends Cubit<NewsListState> {
  NewsRepository newsRepository;

 @factoryMethod
  NewsListViewModelBloc(this.newsRepository) : super(LoadingState("Loading.."));

  void getNews(String sourceId) async {
    emit(LoadingState("Loading"));

    try {
      var newsList = await newsRepository.getNews(sourceId);
      emit(SuccessState(newsList ?? []));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}

sealed class NewsListState {}

class SuccessState extends NewsListState {
  List<News> newsList;
  SuccessState(this.newsList);
}

class ErrorState extends NewsListState {
  String errorMessage;
  ErrorState(this.errorMessage);
}

class LoadingState extends NewsListState {
  String loadingState;
  LoadingState(this.loadingState);
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/RepositoryContract/news_repo.dart';
import '../DataLayer/Model/NewsResponse/news.dart';

@injectable
class NewsSearchBloc extends Cubit<NewsSearchState>{
  NewsRepository newsRepository;
  @factoryMethod
  NewsSearchBloc(this.newsRepository):super(LoadingState("loading"));

  void searchNews(String query) async {
    emit(LoadingState("Loading"));
    try{
      var newsSearched =  await newsRepository.searchNews(query);
      emit(SuccessState(newsSearched));

    }catch(e){
      emit(ErrorState(e.toString()));
    }

  }
}


sealed class NewsSearchState{}
class LoadingState extends NewsSearchState{
  String loadingMessage;
  LoadingState(this.loadingMessage);
}
class ErrorState extends NewsSearchState{
  String errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends NewsSearchState {
  List<News> newsSearched;
  SuccessState(this.newsSearched);
}
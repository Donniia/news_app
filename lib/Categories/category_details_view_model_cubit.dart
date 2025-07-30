import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../DataLayer/Model/SourcesResponse/Source.dart';
import '../RepositoryContract/source_repository.dart';

@injectable
class CategoryDetailsViewModelBloc extends Cubit<CategoryDetailsState>{
  SourcesRepository sourcesRepository;

@factoryMethod
  CategoryDetailsViewModelBloc(this.sourcesRepository):super(LoadingState("Loading..."));

void getSources(String categoryId) async{
  emit(LoadingState("Loading"));

  try{
   var sourcesList = await sourcesRepository.getSources(categoryId);
  emit(SuccessState(sourcesList??[]));
  }catch(e){
    emit(ErrorState(e.toString()));
  }
}
}
sealed class CategoryDetailsState {

}

class SuccessState extends CategoryDetailsState{
  List<Source> sourcesList;
  SuccessState(this.sourcesList);
}
class LoadingState extends CategoryDetailsState{
  String loadingMessage;
  LoadingState(this.loadingMessage);
}
class ErrorState extends CategoryDetailsState{
  String errorMessage;
  ErrorState(this.errorMessage);
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/DataLayer/DI/di.dart';
import 'package:news_app/News/news_List_view_Model_cubit.dart';
import 'package:news_app/News/news_widget.dart';
import '../DataLayer/Model/SourcesResponse/Source.dart';

class NewsList extends StatelessWidget {
  Source source;

  NewsList(this.source, {super.key});

  NewsListViewModelBloc viewModel = getIt.get<NewsListViewModelBloc>();

  @override


  @override
  Widget build(BuildContext context) {
    viewModel.getNews(source.id!);
    return BlocBuilder<NewsListViewModelBloc,NewsListState>(
        bloc: viewModel,
        builder: (context, state) {
          switch (state) {
            case LoadingState():
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            case ErrorState():
              {
                return Center(
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text("No Connection")),
                );
              }
            case SuccessState():
              {
                var newsList = state.newsList;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return NewsWidget(newsList[index]);
                  },
                  itemCount: newsList.length,
                );
              }
          }
        });

    // return ChangeNotifierProvider(create: (context)=>viewModel,
    //   child: Consumer<NewsListViewModel>(builder: (context,viewModel,child){
    //     if(viewModel.showLoading == true){
    //       return const Center(
    //                child: CircularProgressIndicator(),
    //              );
    //     }
    //     if(viewModel.errorMessage != null){
    //       return Center(child: ElevatedButton(onPressed: (){viewModel.getNews(widget.source.id??"");}, child: const Text("No Connection")),);
    //     }
    //
    //     var newsList = viewModel.newsList;
    //      return ListView.builder(itemBuilder: (context,index){
    //        return NewsWidget(newsList[index]);
    //      },itemCount: newsList!.length,);
    //   }),);
  }
}

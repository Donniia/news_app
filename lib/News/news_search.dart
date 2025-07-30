import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/DataLayer/DI/di.dart';
import 'package:news_app/News/news_search_bloc.dart';
import 'package:news_app/News/news_widget.dart';

class NewsSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () {
      showResults(context);
    }, icon: Icon(Icons.search))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
      return buildSuggestions(context);
  }

  @override
  Widget build(BuildContext context){
    return BlocProvider(
      create: (context) => getIt<NewsSearchBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Search News"),
        ),
        body: buildSuggestions(context),
      ),
    );
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      NewsSearchBloc viewModel = context.read<NewsSearchBloc>();
      viewModel.searchNews(query);
      return BlocBuilder<NewsSearchBloc,NewsSearchState>(builder:(context,state){

        switch (state.runtimeType) {
          case LoadingState:
            return const Center(child: CircularProgressIndicator());
          case ErrorState:
            return Center(
              child: ElevatedButton(
                  onPressed: () {}, child: const Text("Not Found")),
            );
          case SuccessState:
            var newsList = (state as SuccessState).newsSearched;
            return ListView.builder(
              itemBuilder: (context, index) {
                return NewsWidget(newsList[index]);
              },
              itemCount: newsList.length,
            );
          default:
            return Container();
        }

      });
    } else {
      return Container();
    }
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(borderSide: BorderSide.none)
      ),
      appBarTheme: const AppBarTheme(
        color: Color(0xff39A552),
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 22, fontWeight: FontWeight.w400, color: Colors.white),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
    );
  }


}

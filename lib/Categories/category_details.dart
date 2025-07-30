import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/Categories/category.dart';

import 'package:news_app/Categories/category_details_view_model_cubit.dart';
import 'package:news_app/Categories/sources_tabs.dart';
import 'package:news_app/DataLayer/DI/di.dart';

class CategoryDetails extends StatefulWidget {
  Category category;

  CategoryDetails(this.category);

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  var viewModel = getIt.get<CategoryDetailsViewModelBloc>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsViewModelBloc, CategoryDetailsState>(
        bloc: viewModel,
        builder: (context, state) {
          switch (state) {
            case LoadingState():
              {
                return Center(child: Column(
                  children: [
                    Text(state.loadingMessage,style: const TextStyle(color: Colors.black),),
                   const  CircularProgressIndicator(),
                  ],
                ));
              }
            case ErrorState():
              {
                return Column(
                  children: [
                    Text(state.errorMessage ?? ""),
                    ElevatedButton(
                        onPressed: () {
                          viewModel.getSources(widget.category.id);
                        },
                        child: const Text('Try again'))
                  ],
                );
              }
            case SuccessState():
              {
                var sourcesList = state.sourcesList;
                if (sourcesList == null || sourcesList.isEmpty) {
                  return const Center(child: Text("No sources available"));
                }

                return SourcesTabs(sourcesList);
              }
          }
        });
  }
}

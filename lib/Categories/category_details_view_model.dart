// import 'package:flutter/material.dart';
//
// import '../DataLayer/API/api_manager.dart';
// import '../DataLayer/Model/SourcesResponse/Source.dart';
//
//
// class CategoryDetailsViewModel extends ChangeNotifier {
//   List<Source>? sourcesList;
//   String? errorMessage;
//   bool? showLoading;
//
//   void getSources(String categoryId) async {
//     showLoading =true;
//     sourcesList = null;
//     errorMessage =null;
//     notifyListeners();
//
//    try{
//      var response = await ApiManager.getSources(categoryId);
//      showLoading =false;
//      if (response!.status == "error") {
//        errorMessage = response.message;
//      } else {
//        sourcesList = response.sources;
//      }
//    }catch(e){
//      showLoading=false;
//       errorMessage = e.toString();
//    }
//    notifyListeners();
//   }
// }

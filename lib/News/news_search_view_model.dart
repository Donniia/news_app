// import 'package:flutter/material.dart';
//
// import '../DataLayer/API/api_manager.dart';
// import '../DataLayer/Model/NewsResponse/news.dart';
// class NewsSearchViewModel extends ChangeNotifier{
//   bool? showLoading;
//   String? errorMessage;
// List<News>? searchResult;
//
//   searchNews(String query) async {
//     showLoading=true;
//     errorMessage=null;
//     searchResult = null;
//     notifyListeners();
//
// try{
//   var response = await ApiManager.searchNews(query);
//   if(response.status=='error'){
//     errorMessage = response.message;
//   }else{
//     showLoading = false;
//     searchResult =  response.articles;
//   }
// }catch(e){
//   errorMessage =e.toString();
//   showLoading=false;
// }
// notifyListeners();
//   }
// }
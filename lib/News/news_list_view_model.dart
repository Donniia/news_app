// import 'package:flutter/material.dart';
//
// import '../DataLayer/API/api_manager.dart';
// import '../DataLayer/Model/NewsResponse/news.dart';
//
// class NewsListViewModel extends ChangeNotifier {
//   List<News>? newsList;
//   bool? showLoading;
//   String? errorMessage;
//
//   void getNews(String sourceId) async {
//     showLoading = true;
//     newsList = null;
//     errorMessage=null;
//     notifyListeners();
//
//     try {
//       var response = await ApiManager.getNews(sourceId);
//       if (response.status == "error") {
//         errorMessage = response.message;
//       } else {
//         newsList = response.articles;
//         showLoading = false;
//       }
//     } catch (e) {
//       showLoading = false;
//       errorMessage = e.toString();
//     }
//     notifyListeners();
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:news_app/DataLayer/API/api_constant.dart';

import '../Model/NewsResponse/NewsResponse.dart';
import '../Model/SourcesResponse/SourcesResponse.dart';

@singleton
class ApiManager {
   Future<SourcesResponse?> getSources(String categoryId) async {
  try{
    var url = Uri.https(ApiConstants.baseUrl, '/v2/top-headlines/sources',
        {'apiKey': ApiConstants.apiKey, 'category': categoryId});
    var response = await http.get(url);
    if(response.statusCode == 200){
      var json = jsonDecode(response.body);
      var sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;
    }else{
      print('Failed to load sources: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }catch (error) {
    print('Error occurred: $error');
  }
  return null;


  }

  Future<NewsResponse> getNews(String? sourceId) async{
    var url = Uri.https(ApiConstants.baseUrl,'/v2/everything',{
      'apiKey':ApiConstants.apiKey,
      'sources':sourceId
    });
   var response = await http.get(url);
   var json = jsonDecode(response.body);
   var newsResponse = NewsResponse.fromJson(json);
   return newsResponse;


  }

 Future<NewsResponse> searchNews(String? query) async{
    var url = Uri.https(ApiConstants.baseUrl,'/v2/everything',{
      'apiKey':ApiConstants.apiKey,
      'q':query
    });
   var response = await http.get(url);
   var json = jsonDecode(response.body);
   var newsResponse = NewsResponse.fromJson(json);
   return newsResponse;


  }
}



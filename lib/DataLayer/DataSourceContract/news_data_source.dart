import 'package:news_app/DataLayer/Model/NewsResponse/news.dart';

abstract class NewsDataSource{
  Future<List<News>> getNews(String sourceId);
  Future<List<News>> searchNews(String query);
}
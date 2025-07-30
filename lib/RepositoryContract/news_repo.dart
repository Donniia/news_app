import 'package:news_app/DataLayer/Model/NewsResponse/news.dart';

abstract class NewsRepository{
  Future<List<News>> getNews(sourceId);
  Future<List<News>> searchNews(query);
}
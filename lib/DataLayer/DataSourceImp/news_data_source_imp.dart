import 'package:injectable/injectable.dart';
import 'package:news_app/DataLayer/API/api_manager.dart';
import 'package:news_app/DataLayer/DataSourceContract/news_data_source.dart';
import 'package:news_app/DataLayer/Model/NewsResponse/news.dart';

@Injectable(as: NewsDataSource)
class NewsDataSourceImp extends NewsDataSource{
  ApiManager apiManager;

  @factoryMethod
  NewsDataSourceImp(this.apiManager);

  @override
  Future<List<News>> getNews(String sourceId) async{
  var response = await apiManager.getNews(sourceId);
  return response.articles??[];
  }

  @override
  Future<List<News>> searchNews(String query) async {
    var response = await apiManager.searchNews(query);
    return response.articles??[];
  }
}
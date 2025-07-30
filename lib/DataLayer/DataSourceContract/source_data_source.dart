import '../Model/SourcesResponse/Source.dart';

abstract class SourcesDataSource{
  Future<List<Source>?> getSources(String categoryId);
}
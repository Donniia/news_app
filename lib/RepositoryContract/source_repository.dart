import '../DataLayer/Model/SourcesResponse/Source.dart';

abstract class SourcesRepository{
  Future<List<Source>?> getSources(String categoryId);
}
// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../Categories/category_details_view_model_cubit.dart' as _i950;
import '../../News/news_List_view_Model_cubit.dart' as _i856;
import '../../News/news_search_bloc.dart' as _i626;
import '../../RepositoryContract/news_repo.dart' as _i106;
import '../../RepositoryContract/source_repository.dart' as _i525;
import '../API/api_manager.dart' as _i590;
import '../DataSourceContract/news_data_source.dart' as _i463;
import '../DataSourceContract/source_data_source.dart' as _i695;
import '../DataSourceImp/news_data_source_imp.dart' as _i816;
import '../DataSourceImp/source_data_source_imp.dart' as _i255;
import '../RepositoryImp/news_repo_imp.dart' as _i848;
import '../RepositoryImp/source_repo_imp.dart' as _i805;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i590.ApiManager>(() => _i590.ApiManager());
    gh.factory<_i463.NewsDataSource>(
      () => _i816.NewsDataSourceImp(gh<_i590.ApiManager>()),
    );
    gh.factory<_i695.SourcesDataSource>(
      () => _i255.SourcesDataSourceImp(gh<_i590.ApiManager>()),
    );
    gh.factory<_i106.NewsRepository>(
      () => _i848.NewsRepositoryImp(gh<_i463.NewsDataSource>()),
    );
    gh.factory<_i525.SourcesRepository>(
      () => _i805.SourceRepositoryImp(gh<_i695.SourcesDataSource>()),
    );
    gh.factory<_i950.CategoryDetailsViewModelBloc>(
      () => _i950.CategoryDetailsViewModelBloc(gh<_i525.SourcesRepository>()),
    );
    gh.factory<_i856.NewsListViewModelBloc>(
      () => _i856.NewsListViewModelBloc(gh<_i106.NewsRepository>()),
    );
    gh.factory<_i626.NewsSearchBloc>(
      () => _i626.NewsSearchBloc(gh<_i106.NewsRepository>()),
    );
    return this;
  }
}

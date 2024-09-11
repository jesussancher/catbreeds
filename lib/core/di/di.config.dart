// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/data_sources/local/cats_local_api.dart' as _i26;
import '../../data/data_sources/local/i_cats_local_api.dart' as _i11;
import '../../data/data_sources/remote/cats_remote_api.dart' as _i25;
import '../../data/data_sources/remote/i_cats_remote_api.dart' as _i9;
import '../../data/repositories/local/cats_local_repository.dart' as _i29;
import '../../data/repositories/remote/cats_remote_repository.dart' as _i28;
import '../../domain/models/cat.dart' as _i21;
import '../../domain/repositories/i_cats_local_repository.dart' as _i14;
import '../../domain/repositories/i_cats_remote_repository.dart' as _i10;
import '../../domain/usecases/fetch_all_cats_paginated_usecase.dart' as _i13;
import '../../domain/usecases/get_all_cats_usecase.dart' as _i16;
import '../../domain/usecases/search_cats_usecase.dart' as _i15;
import '../../domain/usecases/set_all_cats_usecase.dart' as _i17;
import '../../presentation/cat_card_viewmodel.dart' as _i7;
import '../../presentation/detail_viewmodel.dart' as _i8;
import '../../presentation/home_viewmodel.dart' as _i18;
import '../../presentation/search_viewmodel.dart' as _i19;
import '../../ui/pages/detail_view.dart' as _i12;
import '../../ui/pages/home_view.dart' as _i4;
import '../../ui/pages/search_view.dart' as _i5;
import '../../ui/pages/splash_view.dart' as _i3;
import '../network/i_http_client.dart' as _i6;
import 'module/api_module.dart' as _i24;
import 'module/base_module.dart' as _i22;
import 'module/repository_module.dart' as _i27;
import 'module/usecase_module.dart' as _i30;
import 'module/view_module.dart' as _i20;
import 'module/viewmodel_module.dart' as _i23;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final viewModule = _$ViewModule(this);
    final baseModule = _$BaseModule();
    final viewModelModule = _$ViewModelModule(this);
    final apiModule = _$ApiModule(this);
    final repositoryModule = _$RepositoryModule(this);
    final useCaseModule = _$UseCaseModule(this);
    gh.factory<_i3.SplashView>(() => viewModule.splashView);
    gh.factory<_i4.HomeView>(() => viewModule.homeView);
    gh.factory<_i5.SearchView>(() => viewModule.serachView);
    gh.factory<_i6.IHttpClient>(() => baseModule.httpClient);
    gh.factory<_i7.CatCardViewModel>(() => viewModelModule.catCardViewmodel);
    gh.factory<_i8.DetailViewModel>(() => viewModelModule.detailViewModel);
    gh.singleton<_i9.ICatsRemoteApi>(() => apiModule.catsRemoteApi);
    gh.singleton<_i10.ICatsRemoteRepository>(
        () => repositoryModule.catsRemoteRepository);
    gh.singleton<_i11.ICatsLocalApi>(() => apiModule.catsLocalApi);
    gh.factory<_i12.DetailView>(() => viewModule.detailView);
    gh.factory<_i13.FetchAllCatsPaginatedUseCase>(
        () => useCaseModule.fetchAllCatsPaginatedUseCase);
    gh.singleton<_i14.ICatsLocalRepository>(
        () => repositoryModule.catsLocalRepository);
    gh.factory<_i15.SearchCatsdUseCase>(() => useCaseModule.searchCatsdUseCase);
    gh.factory<_i16.GetAllCatsUseCase>(() => useCaseModule.getAllCatsUseCase);
    gh.factory<_i17.SetAllCatsUseCase>(() => useCaseModule.setAllCatsUseCase);
    gh.factory<_i18.HomeViewModel>(() => viewModelModule.homeViewmodel);
    gh.factory<_i19.SearchViewModel>(() => viewModelModule.searchViewModel);
    return this;
  }
}

class _$ViewModule extends _i20.ViewModule {
  _$ViewModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i3.SplashView get splashView => _i3.SplashView();

  @override
  _i4.HomeView get homeView => _i4.HomeView();

  @override
  _i5.SearchView get serachView => _i5.SearchView();

  @override
  _i12.DetailView get detailView => _i12.DetailView(_getIt<_i21.Cat>());
}

class _$BaseModule extends _i22.BaseModule {}

class _$ViewModelModule extends _i23.ViewModelModule {
  _$ViewModelModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i7.CatCardViewModel get catCardViewmodel => _i7.CatCardViewModel();

  @override
  _i8.DetailViewModel get detailViewModel => _i8.DetailViewModel();

  @override
  _i18.HomeViewModel get homeViewmodel => _i18.HomeViewModel(
        _getIt<_i13.FetchAllCatsPaginatedUseCase>(),
        _getIt<_i17.SetAllCatsUseCase>(),
      );

  @override
  _i19.SearchViewModel get searchViewModel => _i19.SearchViewModel(
        _getIt<_i15.SearchCatsdUseCase>(),
        _getIt<_i16.GetAllCatsUseCase>(),
      );
}

class _$ApiModule extends _i24.ApiModule {
  _$ApiModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i25.CatsRemoteApi get catsRemoteApi =>
      _i25.CatsRemoteApi(_getIt<_i6.IHttpClient>());

  @override
  _i26.CatsLocalApi get catsLocalApi => _i26.CatsLocalApi();
}

class _$RepositoryModule extends _i27.RepositoryModule {
  _$RepositoryModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i28.CatsRemoteRepository get catsRemoteRepository =>
      _i28.CatsRemoteRepository(_getIt<_i9.ICatsRemoteApi>());

  @override
  _i29.CatsLocalRepository get catsLocalRepository =>
      _i29.CatsLocalRepository(_getIt<_i11.ICatsLocalApi>());
}

class _$UseCaseModule extends _i30.UseCaseModule {
  _$UseCaseModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i13.FetchAllCatsPaginatedUseCase get fetchAllCatsPaginatedUseCase =>
      _i13.FetchAllCatsPaginatedUseCase(_getIt<_i10.ICatsRemoteRepository>());

  @override
  _i15.SearchCatsdUseCase get searchCatsdUseCase => _i15.SearchCatsdUseCase(
        _getIt<_i10.ICatsRemoteRepository>(),
        _getIt<_i14.ICatsLocalRepository>(),
      );

  @override
  _i16.GetAllCatsUseCase get getAllCatsUseCase =>
      _i16.GetAllCatsUseCase(_getIt<_i14.ICatsLocalRepository>());

  @override
  _i17.SetAllCatsUseCase get setAllCatsUseCase =>
      _i17.SetAllCatsUseCase(_getIt<_i14.ICatsLocalRepository>());
}

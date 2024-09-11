// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/data_sources/local/cats_local_api.dart' as _i25;
import '../../data/data_sources/local/i_cats_local_api.dart' as _i9;
import '../../data/data_sources/remote/cats_remote_api.dart' as _i24;
import '../../data/data_sources/remote/i_cats_remote_api.dart' as _i7;
import '../../data/repositories/local/cats_local_repository.dart' as _i28;
import '../../data/repositories/remote/cats_remote_repository.dart' as _i27;
import '../../domain/repositories/i_cats_local_repository.dart' as _i11;
import '../../domain/repositories/i_cats_remote_repository.dart' as _i8;
import '../../domain/usecases/fetch_all_cats_paginated_usecase.dart' as _i10;
import '../../domain/usecases/fetch_cat_image_url_usecase.dart' as _i12;
import '../../domain/usecases/get_all_cats_usecase.dart' as _i14;
import '../../domain/usecases/get_cat_image_url_by_id_usecase.dart' as _i16;
import '../../domain/usecases/search_cats_usecase.dart' as _i13;
import '../../domain/usecases/set_all_cats_usecase.dart' as _i15;
import '../../domain/usecases/set_cat_image_url_by_id_usecase.dart' as _i17;
import '../../presentation/cat_card_viewmodel.dart' as _i18;
import '../../presentation/home_viewmodel.dart' as _i20;
import '../../presentation/search_viewmodel.dart' as _i19;
import '../../ui/pages/home_view.dart' as _i4;
import '../../ui/pages/search_view.dart' as _i5;
import '../../ui/pages/splash_view.dart' as _i3;
import '../network/i_http_client.dart' as _i6;
import 'module/api_module.dart' as _i23;
import 'module/base_module.dart' as _i22;
import 'module/repository_module.dart' as _i26;
import 'module/usecase_module.dart' as _i29;
import 'module/view_module.dart' as _i21;
import 'module/viewmodel_module.dart' as _i30;

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
    final viewModule = _$ViewModule();
    final baseModule = _$BaseModule();
    final apiModule = _$ApiModule(this);
    final repositoryModule = _$RepositoryModule(this);
    final useCaseModule = _$UseCaseModule(this);
    final viewModelModule = _$ViewModelModule(this);
    gh.factory<_i3.SplashView>(() => viewModule.splashView);
    gh.factory<_i4.HomeView>(() => viewModule.homeView);
    gh.factory<_i5.SearchView>(() => viewModule.serachView);
    gh.factory<_i6.IHttpClient>(() => baseModule.httpClient);
    gh.singleton<_i7.ICatsRemoteApi>(() => apiModule.catsRemoteApi);
    gh.singleton<_i8.ICatsRemoteRepository>(
        () => repositoryModule.catsRemoteRepository);
    gh.singleton<_i9.ICatsLocalApi>(() => apiModule.catsLocalApi);
    gh.factory<_i10.FetchAllCatsPaginatedUseCase>(
        () => useCaseModule.fetchAllCatsPaginatedUseCase);
    gh.singleton<_i11.ICatsLocalRepository>(
        () => repositoryModule.catsLocalRepository);
    gh.factory<_i12.FetchCatImageUrlUseCase>(
        () => useCaseModule.fetchCatImageUrlUseCase);
    gh.factory<_i13.SearchCatsdUseCase>(() => useCaseModule.searchCatsdUseCase);
    gh.factory<_i14.GetAllCatsUseCase>(() => useCaseModule.getAllCatsUseCase);
    gh.factory<_i15.SetAllCatsUseCase>(() => useCaseModule.setAllCatsUseCase);
    gh.factory<_i16.GetCatImageUrlByIdUseCase>(
        () => useCaseModule.getCatImageUrlByIdUseCase);
    gh.factory<_i17.SetCatImageUrlByIdUseCase>(
        () => useCaseModule.setCatImageUrlByIdUseCase);
    gh.factory<_i18.CatCardViewModel>(() => viewModelModule.catCardViewmodel);
    gh.factory<_i19.SearchViewModel>(() => viewModelModule.searchViewModel);
    gh.factory<_i20.HomeViewModel>(() => viewModelModule.homeViewmodel);
    return this;
  }
}

class _$ViewModule extends _i21.ViewModule {
  @override
  _i3.SplashView get splashView => _i3.SplashView();

  @override
  _i4.HomeView get homeView => _i4.HomeView();

  @override
  _i5.SearchView get serachView => _i5.SearchView();
}

class _$BaseModule extends _i22.BaseModule {}

class _$ApiModule extends _i23.ApiModule {
  _$ApiModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i24.CatsRemoteApi get catsRemoteApi =>
      _i24.CatsRemoteApi(_getIt<_i6.IHttpClient>());

  @override
  _i25.CatsLocalApi get catsLocalApi => _i25.CatsLocalApi();
}

class _$RepositoryModule extends _i26.RepositoryModule {
  _$RepositoryModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i27.CatsRemoteRepository get catsRemoteRepository =>
      _i27.CatsRemoteRepository(_getIt<_i7.ICatsRemoteApi>());

  @override
  _i28.CatsLocalRepository get catsLocalRepository =>
      _i28.CatsLocalRepository(_getIt<_i9.ICatsLocalApi>());
}

class _$UseCaseModule extends _i29.UseCaseModule {
  _$UseCaseModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i10.FetchAllCatsPaginatedUseCase get fetchAllCatsPaginatedUseCase =>
      _i10.FetchAllCatsPaginatedUseCase(_getIt<_i8.ICatsRemoteRepository>());

  @override
  _i12.FetchCatImageUrlUseCase get fetchCatImageUrlUseCase =>
      _i12.FetchCatImageUrlUseCase(
        _getIt<_i8.ICatsRemoteRepository>(),
        _getIt<_i11.ICatsLocalRepository>(),
      );

  @override
  _i13.SearchCatsdUseCase get searchCatsdUseCase => _i13.SearchCatsdUseCase(
        _getIt<_i8.ICatsRemoteRepository>(),
        _getIt<_i11.ICatsLocalRepository>(),
      );

  @override
  _i14.GetAllCatsUseCase get getAllCatsUseCase =>
      _i14.GetAllCatsUseCase(_getIt<_i11.ICatsLocalRepository>());

  @override
  _i15.SetAllCatsUseCase get setAllCatsUseCase =>
      _i15.SetAllCatsUseCase(_getIt<_i11.ICatsLocalRepository>());

  @override
  _i16.GetCatImageUrlByIdUseCase get getCatImageUrlByIdUseCase =>
      _i16.GetCatImageUrlByIdUseCase(_getIt<_i11.ICatsLocalRepository>());

  @override
  _i17.SetCatImageUrlByIdUseCase get setCatImageUrlByIdUseCase =>
      _i17.SetCatImageUrlByIdUseCase(_getIt<_i11.ICatsLocalRepository>());
}

class _$ViewModelModule extends _i30.ViewModelModule {
  _$ViewModelModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i18.CatCardViewModel get catCardViewmodel => _i18.CatCardViewModel(
        _getIt<_i12.FetchCatImageUrlUseCase>(),
        _getIt<_i16.GetCatImageUrlByIdUseCase>(),
      );

  @override
  _i19.SearchViewModel get searchViewModel =>
      _i19.SearchViewModel(_getIt<_i13.SearchCatsdUseCase>());

  @override
  _i20.HomeViewModel get homeViewmodel => _i20.HomeViewModel(
        _getIt<_i10.FetchAllCatsPaginatedUseCase>(),
        _getIt<_i15.SetAllCatsUseCase>(),
      );
}

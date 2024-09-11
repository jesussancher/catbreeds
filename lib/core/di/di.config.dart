// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/data_sources/local/cats_local_api.dart' as _i19;
import '../../data/data_sources/local/i_cats_local_api.dart' as _i6;
import '../../data/data_sources/remote/cats_remote_api.dart' as _i18;
import '../../data/data_sources/remote/i_cats_remote_api.dart' as _i4;
import '../../data/repositories/local/cats_local_repository.dart' as _i22;
import '../../data/repositories/remote/cats_remote_repository.dart' as _i21;
import '../../domain/repositories/i_cats_local_repository.dart' as _i9;
import '../../domain/repositories/i_cats_remote_repository.dart' as _i5;
import '../../domain/usecases/fetch_all_cats_paginated_usecase.dart' as _i7;
import '../../domain/usecases/fetch_cat_image_url_usecase.dart' as _i10;
import '../../domain/usecases/get_cat_image_url_by_id_usecase.dart' as _i12;
import '../../domain/usecases/listen_all_cats_usecase.dart' as _i8;
import '../../domain/usecases/set_all_cats_usecase.dart' as _i11;
import '../../domain/usecases/set_cat_image_url_by_id_usecase.dart' as _i13;
import '../../presentation/cat_card_viewmodel.dart' as _i14;
import '../../presentation/home_viewmodel.dart' as _i15;
import '../network/i_http_client.dart' as _i3;
import 'module/api_module.dart' as _i17;
import 'module/base_module.dart' as _i16;
import 'module/repository_module.dart' as _i20;
import 'module/usecase_module.dart' as _i23;
import 'module/viewmodel_module.dart' as _i24;

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
    final baseModule = _$BaseModule();
    final apiModule = _$ApiModule(this);
    final repositoryModule = _$RepositoryModule(this);
    final useCaseModule = _$UseCaseModule(this);
    final viewModelModule = _$ViewModelModule(this);
    gh.factory<_i3.IHttpClient>(() => baseModule.httpClient);
    gh.singleton<_i4.ICatsRemoteApi>(() => apiModule.catsRemoteApi);
    gh.singleton<_i5.ICatsRemoteRepository>(
        () => repositoryModule.catsRemoteRepository);
    gh.singleton<_i6.ICatsLocalApi>(() => apiModule.catsLocalApi);
    gh.factory<_i7.GetAllCatsPaginatedUseCase>(
        () => useCaseModule.getAllCatsPaginatedUseCase);
    gh.factory<_i8.ListenAllCatsUseCase>(
        () => useCaseModule.listenAllCatsUseCase);
    gh.singleton<_i9.ICatsLocalRepository>(
        () => repositoryModule.catsLocalRepository);
    gh.factory<_i10.FetchCatImageUrlUseCase>(
        () => useCaseModule.fetchCatImageUrlUseCase);
    gh.factory<_i11.SetAllCatsUseCase>(() => useCaseModule.setAllCatsUseCase);
    gh.factory<_i12.GetCatImageUrlByIdUseCase>(
        () => useCaseModule.getCatImageUrlByIdUseCase);
    gh.factory<_i13.SetCatImageUrlByIdUseCase>(
        () => useCaseModule.setCatImageUrlByIdUseCase);
    gh.factory<_i14.CatCardViewModel>(() => viewModelModule.catCardViewmodel);
    gh.factory<_i15.HomeViewModel>(() => viewModelModule.homeViewmodel);
    return this;
  }
}

class _$BaseModule extends _i16.BaseModule {}

class _$ApiModule extends _i17.ApiModule {
  _$ApiModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i18.CatsRemoteApi get catsRemoteApi =>
      _i18.CatsRemoteApi(_getIt<_i3.IHttpClient>());

  @override
  _i19.CatsLocalApi get catsLocalApi => _i19.CatsLocalApi();
}

class _$RepositoryModule extends _i20.RepositoryModule {
  _$RepositoryModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i21.CatsRemoteRepository get catsRemoteRepository =>
      _i21.CatsRemoteRepository(_getIt<_i4.ICatsRemoteApi>());

  @override
  _i22.CatsLocalRepository get catsLocalRepository =>
      _i22.CatsLocalRepository(_getIt<_i6.ICatsLocalApi>());
}

class _$UseCaseModule extends _i23.UseCaseModule {
  _$UseCaseModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i7.GetAllCatsPaginatedUseCase get getAllCatsPaginatedUseCase =>
      _i7.GetAllCatsPaginatedUseCase(_getIt<_i5.ICatsRemoteRepository>());

  @override
  _i8.ListenAllCatsUseCase get listenAllCatsUseCase =>
      _i8.ListenAllCatsUseCase(_getIt<_i5.ICatsRemoteRepository>());

  @override
  _i10.FetchCatImageUrlUseCase get fetchCatImageUrlUseCase =>
      _i10.FetchCatImageUrlUseCase(
        _getIt<_i5.ICatsRemoteRepository>(),
        _getIt<_i9.ICatsLocalRepository>(),
      );

  @override
  _i11.SetAllCatsUseCase get setAllCatsUseCase =>
      _i11.SetAllCatsUseCase(_getIt<_i9.ICatsLocalRepository>());

  @override
  _i12.GetCatImageUrlByIdUseCase get getCatImageUrlByIdUseCase =>
      _i12.GetCatImageUrlByIdUseCase(_getIt<_i9.ICatsLocalRepository>());

  @override
  _i13.SetCatImageUrlByIdUseCase get setCatImageUrlByIdUseCase =>
      _i13.SetCatImageUrlByIdUseCase(_getIt<_i9.ICatsLocalRepository>());
}

class _$ViewModelModule extends _i24.ViewModelModule {
  _$ViewModelModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i14.CatCardViewModel get catCardViewmodel => _i14.CatCardViewModel(
        _getIt<_i10.FetchCatImageUrlUseCase>(),
        _getIt<_i12.GetCatImageUrlByIdUseCase>(),
      );

  @override
  _i15.HomeViewModel get homeViewmodel => _i15.HomeViewModel(
        _getIt<_i7.GetAllCatsPaginatedUseCase>(),
        _getIt<_i8.ListenAllCatsUseCase>(),
        _getIt<_i11.SetAllCatsUseCase>(),
      );
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/data_sources/remote/cats_api.dart' as _i10;
import '../../data/data_sources/remote/i_cats_api.dart' as _i4;
import '../../data/repositories/cats_repository.dart' as _i12;
import '../../domain/repositories/i_cats_repository.dart' as _i5;
import '../../domain/usecases/get_all_cats_paginated_usecase.dart' as _i6;
import '../../presentation/home_viewmodel.dart' as _i7;
import '../network/i_http_client.dart' as _i3;
import 'module/api_module.dart' as _i9;
import 'module/base_module.dart' as _i8;
import 'module/repository_module.dart' as _i11;
import 'module/usecase_module.dart' as _i13;
import 'module/viewmodel_module.dart' as _i14;

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
    gh.singleton<_i4.ICatsApi>(() => apiModule.catsApi);
    gh.singleton<_i5.ICatsRepository>(() => repositoryModule.catsRepository);
    gh.factory<_i6.GetAllCatsPaginatedUseCase>(
        () => useCaseModule.getAllCatsPaginatedUseCase);
    gh.factory<_i7.HomeViewModel>(() => viewModelModule.viewModelModule);
    return this;
  }
}

class _$BaseModule extends _i8.BaseModule {}

class _$ApiModule extends _i9.ApiModule {
  _$ApiModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i10.CatsApi get catsApi => _i10.CatsApi(_getIt<_i3.IHttpClient>());
}

class _$RepositoryModule extends _i11.RepositoryModule {
  _$RepositoryModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i12.CatsRepository get catsRepository =>
      _i12.CatsRepository(_getIt<_i4.ICatsApi>());
}

class _$UseCaseModule extends _i13.UseCaseModule {
  _$UseCaseModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i6.GetAllCatsPaginatedUseCase get getAllCatsPaginatedUseCase =>
      _i6.GetAllCatsPaginatedUseCase(_getIt<_i5.ICatsRepository>());
}

class _$ViewModelModule extends _i14.ViewModelModule {
  _$ViewModelModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i7.HomeViewModel get viewModelModule =>
      _i7.HomeViewModel(_getIt<_i6.GetAllCatsPaginatedUseCase>());
}

import 'package:catbreeds/domain/usecases/get_all_cats_paginated_usecase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class UseCaseModule {
  GetAllCatsPaginatedUseCase get getAllCatsPaginatedUseCase;
}

import 'package:catbreeds/domain/usecases/fetch_all_cats_paginated_usecase.dart';
import 'package:catbreeds/domain/usecases/get_all_cats_usecase.dart';
import 'package:catbreeds/domain/usecases/search_cats_usecase.dart';
import 'package:catbreeds/domain/usecases/set_all_cats_usecase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class UseCaseModule {
  FetchAllCatsPaginatedUseCase get fetchAllCatsPaginatedUseCase;
  GetAllCatsUseCase get getAllCatsUseCase;
  SetAllCatsUseCase get setAllCatsUseCase;
  SearchCatsdUseCase get searchCatsdUseCase;
}

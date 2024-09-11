import 'package:catbreeds/domain/usecases/fetch_all_cats_paginated_usecase.dart';
import 'package:catbreeds/domain/usecases/fetch_cat_image_url_usecase.dart';
import 'package:catbreeds/domain/usecases/get_cat_image_url_by_id_usecase.dart';
import 'package:catbreeds/domain/usecases/get_all_cats_usecase.dart';
import 'package:catbreeds/domain/usecases/search_cats_usecase.dart';
import 'package:catbreeds/domain/usecases/set_all_cats_usecase.dart';
import 'package:catbreeds/domain/usecases/set_cat_image_url_by_id_usecase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class UseCaseModule {
  FetchAllCatsPaginatedUseCase get fetchAllCatsPaginatedUseCase;
  FetchCatImageUrlUseCase get fetchCatImageUrlUseCase;
  GetAllCatsUseCase get getAllCatsUseCase;
  SetAllCatsUseCase get setAllCatsUseCase;
  GetCatImageUrlByIdUseCase get getCatImageUrlByIdUseCase;
  SetCatImageUrlByIdUseCase get setCatImageUrlByIdUseCase;
  SearchCatsdUseCase get searchCatsdUseCase;
}

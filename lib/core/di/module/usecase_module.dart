import 'package:catbreeds/domain/usecases/fetch_all_cats_paginated_usecase.dart';
import 'package:catbreeds/domain/usecases/fetch_cat_image_url_usecase.dart';
import 'package:catbreeds/domain/usecases/get_cat_image_url_by_id_usecase.dart';
import 'package:catbreeds/domain/usecases/listen_all_cats_usecase.dart';
import 'package:catbreeds/domain/usecases/set_all_cats_usecase.dart';
import 'package:catbreeds/domain/usecases/set_cat_image_url_by_id_usecase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class UseCaseModule {
  GetAllCatsPaginatedUseCase get getAllCatsPaginatedUseCase;
  FetchCatImageUrlUseCase get fetchCatImageUrlUseCase;
  ListenAllCatsUseCase get listenAllCatsUseCase;
  SetAllCatsUseCase get setAllCatsUseCase;
  GetCatImageUrlByIdUseCase get getCatImageUrlByIdUseCase;
  SetCatImageUrlByIdUseCase get setCatImageUrlByIdUseCase;
}

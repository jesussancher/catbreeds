import 'dart:async';

import 'package:catbreeds/data/data_sources/local/i_cats_local_api.dart';
import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/cat_image_url_params.dart';
import 'package:catbreeds/domain/repositories/i_cats_local_repository.dart';

class CatsLocalRepository implements ICatsLocalRepository {
  final ICatsLocalApi catsApi;

  CatsLocalRepository(this.catsApi);

  @override
  Future<String?> getCatImageUrlById(CatImageUrlParams params) async =>
      catsApi.getCatImageUrlById(params);

  @override
  Future<void> setCatImageUrlById(CatImageUrlParams params) async =>
      catsApi.setCatImageUrlById(params);

  @override
  void setCatsList(List<Cat> list) => catsApi.setCatsList(list);
}

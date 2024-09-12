import 'dart:async';

import 'package:catbreeds/data/data_sources/local/i_cats_local_api.dart';
import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/params/search_params.dart';
import 'package:catbreeds/domain/models/params/set_cats_list_params.dart';
import 'package:catbreeds/domain/repositories/i_cats_local_repository.dart';

class CatsLocalRepository implements ICatsLocalRepository {
  final ICatsLocalApi catsApi;

  CatsLocalRepository(this.catsApi);

  @override
  Future<void> setAllCatsList(SetCatsListParams params) async =>
      await catsApi.setAllCatsList(params);

  @override
  Future<List<Cat>> getAllCatsList() async => catsApi.getAllCatsList();

  @override
  Future<List<Cat>> searchCatsByName(SearchParams params) async =>
      await catsApi.searchCatsByName(params);

  @override
  Future<void> addCatsToListFromSearch(SetCatsListParams params) async =>
      await catsApi.addCatsToListFromSearch(params);
}

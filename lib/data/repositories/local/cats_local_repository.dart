import 'dart:async';

import 'package:catbreeds/data/data_sources/local/i_cats_local_api.dart';
import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/search_params.dart';
import 'package:catbreeds/domain/repositories/i_cats_local_repository.dart';

class CatsLocalRepository implements ICatsLocalRepository {
  final ICatsLocalApi catsApi;

  CatsLocalRepository(this.catsApi);

  @override
  Future<void> setAllCatsList(List<Cat> list) async =>
      await catsApi.setAllCatsList(list);

  @override
  Future<List<Cat>> getAllCatsList() async => catsApi.getAllCatsList();

  @override
  Future<List<Cat>> searchCatsByName(SearchParams params) async =>
      await catsApi.searchCatsByName(params);

  @override
  Future<void> addCatsToListFromSearch(List<Cat>? list) async =>
      await catsApi.addCatsToListFromSearch(list);
}

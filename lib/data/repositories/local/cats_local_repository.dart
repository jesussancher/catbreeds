import 'dart:async';

import 'package:catbreeds/domain/domain.dart';
import 'package:catbreeds/data/data_sources/data_sources.dart';

/// Implements [ICatsLocalRepository] for managing local cat data using [ICatsLocalApi].
class CatsLocalRepository implements ICatsLocalRepository {
  final ICatsLocalApi catsApi;

  /// Creates an instance of [CatsLocalRepository] with the provided [catsApi].
  CatsLocalRepository(this.catsApi);

  @override
  Future<void> setAllCatsList(SetCatsListParams params) async {
    await catsApi.setAllCatsList(params);
  }

  @override
  Future<List<Cat>> getAllCatsList() async {
    return await catsApi.getAllCatsList();
  }

  @override
  Future<List<Cat>> searchCatsByName(SearchParams params) async {
    return await catsApi.searchCatsByName(params);
  }

  @override
  Future<void> addCatsToListFromSearch(SetCatsListParams params) async {
    await catsApi.addCatsToListFromSearch(params);
  }
}

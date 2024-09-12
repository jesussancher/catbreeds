import 'dart:async';

import 'package:catbreeds/data/data_sources/data_sources.dart';
import 'package:catbreeds/domain/domain.dart';

class CatsRemoteRepository implements ICatsRemoteRepository {
  final ICatsRemoteApi catsApi;

  CatsRemoteRepository(this.catsApi);

  @override
  Future<Response<List<Cat>>> fetchCatsPaginated(AllCatsParams params) async =>
      await catsApi.fetchCatsPaginated(params);

  @override
  Future<Response<List<Cat>>> searchCatsById(SearchParams params) async =>
      await catsApi.searchCatsById(params);
}

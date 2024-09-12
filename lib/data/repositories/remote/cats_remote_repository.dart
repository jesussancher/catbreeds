import 'dart:async';

import 'package:catbreeds/data/data_sources/data_sources.dart';
import 'package:catbreeds/domain/domain.dart';

/// Implements [ICatsRemoteRepository] for managing remote cat data using [ICatsRemoteApi].
class CatsRemoteRepository implements ICatsRemoteRepository {
  final ICatsRemoteApi catsApi;

  /// Creates an instance of [CatsRemoteRepository] with the provided [catsApi].
  CatsRemoteRepository(this.catsApi);

  @override
  Future<Response<List<Cat>>> fetchCatsPaginated(AllCatsParams params) async {
    return await catsApi.fetchCatsPaginated(params);
  }

  @override
  Future<Response<List<Cat>>> searchCatsById(SearchParams params) async {
    return await catsApi.searchCatsById(params);
  }
}

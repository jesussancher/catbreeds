import 'dart:async';

import 'package:catbreeds/data/data_sources/remote/i_cats_remote_api.dart';
import 'package:catbreeds/domain/models/params/all_cats_params.dart';
import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/network/response.dart';
import 'package:catbreeds/domain/models/params/search_params.dart';
import 'package:catbreeds/domain/repositories/i_cats_remote_repository.dart';

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

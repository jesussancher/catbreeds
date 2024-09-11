import 'dart:async';

import 'package:catbreeds/domain/models/all_cats_params.dart';
import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/network/response.dart';
import 'package:catbreeds/domain/models/search_params.dart';

abstract class ICatsRemoteRepository {
  /// Get all cats list with pagination
  Future<Response<List<Cat>>> fetchCatsPaginated(AllCatsParams params);

  /// Search cats by name
  Future<Response<List<Cat>>> searchCatsById(SearchParams params);
}

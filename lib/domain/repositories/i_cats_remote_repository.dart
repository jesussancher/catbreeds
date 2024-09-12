import 'dart:async';

import 'package:catbreeds/domain/models/params/all_cats_params.dart';
import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/network/response.dart';
import 'package:catbreeds/domain/models/params/search_params.dart';

/// Abstract interface for remote data operations related to cats.
abstract class ICatsRemoteRepository {
  /// Fetches a paginated list of cats.
  ///
  /// [params] Contains pagination parameters.
  /// Returns a [Response] object containing a list of [Cat] objects.
  Future<Response<List<Cat>>> fetchCatsPaginated(AllCatsParams params);

  /// Searches for cats by their IDs.
  ///
  /// [params] Contains search parameters.
  /// Returns a [Response] object containing a list of [Cat] objects.
  Future<Response<List<Cat>>> searchCatsById(SearchParams params);
}

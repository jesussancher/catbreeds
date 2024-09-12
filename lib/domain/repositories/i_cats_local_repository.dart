import 'dart:async';

import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/params/search_params.dart';
import 'package:catbreeds/domain/models/params/set_cats_list_params.dart';

/// Abstract interface for local data operations related to cats.
abstract class ICatsLocalRepository {
  /// Sets the list of cats to a stream.
  ///
  /// [params] Contains the list of cats to set.
  Future<void> setAllCatsList(SetCatsListParams params);

  /// Retrieves the current list of cats from the stream.
  ///
  /// Returns a list of [Cat] objects.
  Future<List<Cat>> getAllCatsList();

  /// Searches for cats by name.
  ///
  /// [params] Contains the search parameters.
  /// Returns a list of [Cat] objects matching the search criteria.
  Future<List<Cat>> searchCatsByName(SearchParams params);

  /// Adds cats to the list from search results.
  ///
  /// [params] Contains the list of cats to add.
  Future<void> addCatsToListFromSearch(SetCatsListParams params);
}

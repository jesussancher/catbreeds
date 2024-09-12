import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/params/search_params.dart';
import 'package:catbreeds/domain/models/params/set_cats_list_params.dart';

/// Interface for local cat data operations.
abstract class ICatsLocalApi {
  /// Saves a list of cats to the local stream.
  Future<void> setAllCatsList(SetCatsListParams params);

  /// Retrieves the list of all cats from the local stream.
  Future<List<Cat>> getAllCatsList();

  /// Searches for cats by name.
  ///
  /// Returns a list of cats matching the search criteria.
  Future<List<Cat>> searchCatsByName(SearchParams params);

  /// Adds cats to the list based on search results.
  Future<void> addCatsToListFromSearch(SetCatsListParams params);
}

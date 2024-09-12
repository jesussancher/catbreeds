import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/params/search_params.dart';
import 'package:catbreeds/domain/models/params/set_cats_list_params.dart';

abstract class ICatsLocalApi {
  /// Set cats lists to stream
  Future<void> setAllCatsList(SetCatsListParams params);

  /// Set cats lists to stream
  Future<List<Cat>> getAllCatsList();

  /// Search cats by name
  Future<List<Cat>> searchCatsByName(SearchParams params);

  /// Add cats to list from search
  Future<void> addCatsToListFromSearch(SetCatsListParams params);
}

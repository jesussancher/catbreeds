import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/search_params.dart';

abstract class ICatsLocalApi {
  /// Set cats lists to stream
  Future<void> setAllCatsList(List<Cat> list);

  /// Set cats lists to stream
  Future<List<Cat>> getAllCatsList();

  /// Search cats by name
  Future<List<Cat>> searchCatsByName(SearchParams params);

  /// Add cats to list from search
  Future<void> addCatsToListFromSearch(List<Cat>? list);
}

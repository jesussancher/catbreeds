import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/cat_image_url_params.dart';
import 'package:catbreeds/domain/models/search_params.dart';

abstract class ICatsLocalApi {
  /// Set cats lists to stream
  Future<void> setAllCatsList(List<Cat> list);

  /// Set cats lists to stream
  Future<List<Cat>> getAllCatsList();

  /// Set getting image qeue list
  Future<void> setGettingImageQeueList(CatImageUrlParams params);

  /// Set getting image qeue list
  Future<bool> getCatIsInQeue(CatImageUrlParams params);

  /// Set cat image url by id
  Future<void> setCatImageUrlById(CatImageUrlParams params);

  /// Get cat image url by id
  Future<String?> getCatImageUrlById(CatImageUrlParams params);

  /// Search cats by name
  Future<List<Cat>> searchCatsByName(SearchParams params);

  /// Add cats to list from search
  Future<void> addCatsToListFromSearch(List<Cat>? list);
}

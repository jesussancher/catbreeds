import 'dart:async';

import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/cat_image_url_params.dart';

abstract class ICatsLocalRepository {
  /// Set cats lists to stream
  void setCatsList(List<Cat> list);

  /// Set getting image qeue list
  Future<void> setGettingImageQeueList(CatImageUrlParams params);

  /// Set getting image qeue list
  Future<bool> getCatIsInQeue(CatImageUrlParams params);

  /// Set cat image url by id
  Future<void> setCatImageUrlById(CatImageUrlParams params);

  /// Get cat image url by id
  Future<String?> getCatImageUrlById(CatImageUrlParams params);
}

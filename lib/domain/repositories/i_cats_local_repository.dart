import 'dart:async';

import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/cat_image_url_params.dart';

abstract class ICatsLocalRepository {
  /// Set cats lists to stream
  void setCatsList(List<Cat> list);

  /// Set cat image url by id
  void setCatImageUrlById(CatImageUrlParams params);

  /// Get cat image url by id
  Future<String?> getCatImageUrlById(CatImageUrlParams params);
}

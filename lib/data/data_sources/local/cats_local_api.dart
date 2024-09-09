import 'dart:async';

import 'package:catbreeds/data/data_sources/local/i_cats_local_api.dart';
import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/cat_image_url_params.dart';
import 'package:rxdart/subjects.dart';

class CatsLocalApi implements ICatsLocalApi {
  BehaviorSubject<List<Cat>> _catsListStreamController =
      BehaviorSubject<List<Cat>>.seeded([]);

  @override
  void setCatsList(List<Cat> list) {
    _catsListStreamController.add(list);
  }

  @override
  Future<void> setCatImageUrlById(CatImageUrlParams params) async {
    final List<Cat> list = _catsListStreamController.value;
    final int filteredCatIndex = list.indexWhere((cat) => cat.id == params.id);
    final Cat filteredCat = list.elementAt(filteredCatIndex);
    filteredCat.setImageUrl(params.url);
    list[filteredCatIndex] = filteredCat;
    _catsListStreamController.add(list);
  }

  @override
  Future<String?> getCatImageUrlById(CatImageUrlParams params) async {
    final List<Cat> list = _catsListStreamController.value;
    final Cat filteredCat = list.firstWhere((cat) => cat.id == params.id);
    return filteredCat.imageUrl;
  }
}

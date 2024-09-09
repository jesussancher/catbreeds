import 'dart:async';

import 'package:catbreeds/data/data_sources/local/i_cats_local_api.dart';
import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/cat_image_url_params.dart';

class CatsLocalApi implements ICatsLocalApi {
  StreamController<List<Cat>> _catsListStreamController =
      StreamController<List<Cat>>();

  @override
  void setCatsList(List<Cat> list) {
    _catsListStreamController.add(list);
  }

  @override
  void setCatImageUrlById(CatImageUrlParams params) async {
    final List<Cat> list = await _catsListStreamController.stream.first;
    final int filteredCatIndex = list.indexWhere((cat) => cat.id == params.id);
    final Cat filteredCat = list.elementAt(filteredCatIndex);
    filteredCat.setImageUrl(params.url);
    list[filteredCatIndex] = filteredCat;
    _catsListStreamController.add(list);
  }

  @override
  Future<String?> getCatImageUrlById(CatImageUrlParams params) async {
    final List<Cat> list = await _catsListStreamController.stream.first;
    final Cat filteredCat = list.firstWhere((cat) => cat.id == params.id);

    return filteredCat.imageUrl;
  }
}

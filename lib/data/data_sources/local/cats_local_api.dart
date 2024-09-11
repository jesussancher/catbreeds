import 'dart:async';

import 'package:catbreeds/data/data_sources/local/i_cats_local_api.dart';
import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/cat_image_url_params.dart';
import 'package:catbreeds/domain/models/search_params.dart';
import 'package:rxdart/subjects.dart';

class CatsLocalApi implements ICatsLocalApi {
  BehaviorSubject<List<Cat>> _catsListStreamController =
      BehaviorSubject<List<Cat>>.seeded([]);

  BehaviorSubject<List<String>> _qeueImageCatsIdStreamController =
      BehaviorSubject<List<String>>.seeded([]);

  @override
  Future<void> setAllCatsList(List<Cat> list) async =>
      _catsListStreamController.add(list);

  Future<void> _addCatsToList(List<Cat> list) async => _catsListStreamController
      .add(_sortByName(_catsListStreamController.value + list));

  @override
  Future<List<Cat>> getAllCatsList() async => _catsListStreamController.value;

  @override
  Future<void> setGettingImageQeueList(CatImageUrlParams params) async {
    final bool existsInQeue = await getCatIsInQeue(params);
    if (existsInQeue || params.id == null) return;
    final List<String> newList = _qeueImageCatsIdStreamController.value;
    newList.add(params.id!);
    _qeueImageCatsIdStreamController.add(newList);
  }

  @override
  Future<bool> getCatIsInQeue(CatImageUrlParams params) async {
    final List<String> list = _qeueImageCatsIdStreamController.value;
    return list.contains(params.id);
  }

  @override
  Future<void> setCatImageUrlById(CatImageUrlParams params) async {
    final List<Cat> list = _catsListStreamController.value;
    final int filteredCatIndex = list.indexWhere((cat) => cat.id == params.id);
    list.elementAt(filteredCatIndex).setImageUrl(params.url);
    _catsListStreamController.add(list);
  }

  @override
  Future<String?> getCatImageUrlById(CatImageUrlParams params) async {
    final List<Cat> list = _catsListStreamController.value;
    final Cat filteredCat = list.firstWhere((cat) => cat.id == params.id);
    return filteredCat.imageUrl;
  }

  @override
  Future<List<Cat>> searchCatsByName(SearchParams params) async {
    final List<Cat> list = _catsListStreamController.value;
    return list
        .where((Cat cat) =>
            cat.name!.toLowerCase().contains(params.q!.toLowerCase()))
        .toList();
  }

  List<Cat> _sortByName(List<Cat> list) {
    list.sort((Cat a, Cat b) => a.name?.compareTo(b.name ?? '') ?? -1);
    return list;
  }

  @override
  Future<void> addCatsToListFromSearch(List<Cat>? list) async {
    if (list == null) return;
    final List<String?> currentIdsList = _catsListStreamController.value
        .map((Cat cat) => cat.id)
        .toSet()
        .toList();
    final List<Cat> catsNotInCurrent = list
        .where((Cat cat) => !currentIdsList.contains(cat.id))
        .toSet()
        .toList();
    _addCatsToList(catsNotInCurrent);
  }
}

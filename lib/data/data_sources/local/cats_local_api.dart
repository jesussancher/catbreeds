import 'dart:async';

import 'package:catbreeds/data/data_sources/local/i_cats_local_api.dart';
import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/params/search_params.dart';
import 'package:catbreeds/domain/models/params/set_cats_list_params.dart';
import 'package:rxdart/subjects.dart';

class CatsLocalApi implements ICatsLocalApi {
  BehaviorSubject<List<Cat>> _catsListStreamController =
      BehaviorSubject<List<Cat>>.seeded([]);

  @override
  Future<void> setAllCatsList(SetCatsListParams params) async =>
      _catsListStreamController.add(params.list ?? []);

  @override
  Future<List<Cat>> getAllCatsList() async => _catsListStreamController.value;

  @override
  Future<List<Cat>> searchCatsByName(SearchParams params) async {
    final List<Cat> list = _catsListStreamController.value;
    return list
        .where((Cat cat) =>
            cat.name!.toLowerCase().startsWith(params.q!.toLowerCase()))
        .toList();
  }

  List<Cat> _sortByName(List<Cat> list) {
    list.sort((Cat a, Cat b) => a.name?.compareTo(b.name ?? '') ?? -1);
    return list;
  }

  @override
  Future<void> addCatsToListFromSearch(SetCatsListParams params) async {
    if (params.list == null) return;
    final List<Cat> currentIdsList =
        _catsListStreamController.value.toSet().toList();
    final List<Cat> catsNotInCurrent = params.list!
        .where(
            (Cat cat) => !currentIdsList.map((Cat e) => e.id).contains(cat.id))
        .toSet()
        .toList();

    _catsListStreamController
        .add(_sortByName(currentIdsList + catsNotInCurrent));
  }
}

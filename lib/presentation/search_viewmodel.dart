import 'dart:async';
import 'dart:math';

import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/network/response.dart';
import 'package:catbreeds/domain/models/params/no_param.dart';
import 'package:catbreeds/domain/models/params/search_params.dart';
import 'package:catbreeds/domain/usecases/get_all_cats_usecase.dart';
import 'package:catbreeds/domain/usecases/search_cats_usecase.dart';
import 'package:catbreeds/presentation/base_viewmodel.dart';
import 'package:flutter/material.dart';

class SearchViewModel extends BaseViewModel {
  final SearchCatsdUseCase _searchCatsdUseCase;
  final GetAllCatsUseCase _getAllCatsUseCase;
  SearchViewModel(
    this._searchCatsdUseCase,
    this._getAllCatsUseCase,
  ) {
    _initRandomizeDummyCatName();
  }

  TextEditingController _inputController = TextEditingController();
  Timer? timer;

  List<Cat> _catsList = [];
  String _dummyCatName = 'Aagean';

  void focusInput(BuildContext context, FocusNode focuseNode) {
    FocusScope.of(context).requestFocus(focuseNode);
  }

  void onSearch(String searchText) async {
    final Response<List<Cat>> response =
        await _searchCatsdUseCase(SearchParams(q: searchText));
    if (response.succeeded) {
      _catsList = response.success?.data ?? [];
      notifyListeners();
    }
  }

  void _initRandomizeDummyCatName() async {
    final List<Cat> allCats = await _getAllCatsUseCase(NoParam());
    if (allCats.isEmpty) return;
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 5), (_) {
      final int randomIndex = Random().nextInt(allCats.length - 1);
      final Cat randomizedCat = allCats.elementAt(randomIndex);
      _dummyCatName = randomizedCat.name ?? '';
      notifyListeners();
    });
  }

  TextEditingController get inputController => _inputController;
  List<Cat> get catsList => _catsList;
  bool get showNoResults =>
      _catsList.isEmpty && _inputController.text.isNotEmpty;
  bool get showFirstSearch => _inputController.text.isEmpty;
  String get dummyCatName => _dummyCatName;
  String get searchText => _inputController.text;
}

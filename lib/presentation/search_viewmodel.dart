import 'dart:async';
import 'dart:math';

import 'package:catbreeds/domain/domain.dart';
import 'package:catbreeds/presentation/presentation.dart';
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

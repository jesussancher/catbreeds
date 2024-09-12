import 'dart:async';
import 'dart:math';

import 'package:catbreeds/domain/domain.dart';
import 'package:catbreeds/presentation/presentation.dart';
import 'package:flutter/material.dart';

/// ViewModel for managing search functionality and displaying a list of cats.
class SearchViewModel extends BaseViewModel {
  final SearchCatsUseCase _searchCatsUseCase;
  final GetAllCatsUseCase _getAllCatsUseCase;
  late Timer timer;

  List<Cat> _catsList = [];
  String _dummyCatName = 'Aagean';
  final TextEditingController _inputController = TextEditingController();

  /// Creates an instance of [SearchViewModel] with use cases for searching and retrieving cats.
  SearchViewModel(
    this._searchCatsUseCase,
    this._getAllCatsUseCase,
  ) {
    _initRandomizeDummyCatName();
  }

  /// Initiates a search with the given [searchText].
  void onSearch(String searchText) async {
    final Response<List<Cat>> response =
        await _searchCatsUseCase(SearchParams(q: searchText));
    if (response.succeeded) {
      _catsList = response.success?.data ?? [];
      notifyListeners();
    }
  }

  /// Initializes and periodically updates the dummy cat name.
  void _initRandomizeDummyCatName() async {
    final List<Cat> allCats = await _getAllCatsUseCase(NoParam());
    if (allCats.isEmpty) return;
    timer = Timer.periodic(Duration(seconds: 5), (_) {
      final int randomIndex = Random().nextInt(allCats.length);
      final Cat randomizedCat = allCats[randomIndex];
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

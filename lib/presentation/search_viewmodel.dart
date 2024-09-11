import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/network/response.dart';
import 'package:catbreeds/domain/models/search_params.dart';
import 'package:catbreeds/domain/usecases/search_cats_usecase.dart';
import 'package:catbreeds/presentation/base_viewmodel.dart';
import 'package:flutter/material.dart';

class SearchViewModel extends BaseViewModel {
  final SearchCatsdUseCase searchCatsdUseCase;
  SearchViewModel(
    this.searchCatsdUseCase,
  );

  TextEditingController _inputController = TextEditingController();

  List<Cat> _catsList = [];

  void focusInput(BuildContext context, FocusNode focuseNode) {
    FocusScope.of(context).requestFocus(focuseNode);
  }

  void onSearch(String searchText) async {
    final Response<List<Cat>> response =
        await searchCatsdUseCase(SearchParams(q: searchText));
    if (response.succeeded) {
      _catsList = response.success?.data ?? [];
      notifyListeners();
    }
  }

  TextEditingController get inputController => _inputController;
  List<Cat> get catsList => _catsList;
}

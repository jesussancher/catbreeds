import 'dart:async';

import 'package:catbreeds/domain/models/all_cats_params.dart';
import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/network/response.dart';
import 'package:catbreeds/domain/usecases/get_all_cats_paginated_usecase.dart';
import 'package:catbreeds/presentation/base_viewmodel.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeViewModel extends BaseViewmodel {
  final GetAllCatsPaginatedUseCase getAllCatsPaginatedUseCase;
  HomeViewModel(this.getAllCatsPaginatedUseCase) {
    _initListeners();
  }

  String _searchQuery = 'go';
  List<Cat> _catsList = [Cat()];

  static const int _pageSize = 10;

  final PagingController<int, Cat> _pagingController =
      PagingController(firstPageKey: 0);

  void _initListeners() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageNumber) async {
    final Response<List<Cat>> response = await getAllCatsPaginatedUseCase(
        AllCatsParams(limit: '10', page: pageNumber.toString()));
    if (response.succeeded) {
      final List<Cat> cats = response.success?.data ?? [];
      final isLastPage = cats.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(cats);
      } else {
        _pagingController.appendPage(cats, pageNumber + 1);
      }
    }
  }

  String get searchQuery => _searchQuery;
  List<Cat> get catsList => _catsList;
  PagingController<int, Cat> get pagingController => _pagingController;
}

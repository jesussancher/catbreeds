import 'dart:async';

import 'package:catbreeds/domain/models/all_cats_params.dart';
import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/network/response.dart';
import 'package:catbreeds/domain/models/no_param.dart';
import 'package:catbreeds/domain/models/set_cats_list_params.dart';
import 'package:catbreeds/domain/usecases/fetch_all_cats_paginated_usecase.dart';
import 'package:catbreeds/domain/usecases/listen_all_cats_usecase.dart';
import 'package:catbreeds/domain/usecases/set_all_cats_usecase.dart';
import 'package:catbreeds/presentation/base_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeViewModel extends BaseViewModel {
  final GetAllCatsPaginatedUseCase getAllCatsPaginatedUseCase;
  final ListenAllCatsUseCase listenAllCatsUseCase;
  final SetAllCatsUseCase setAllCatsUseCase;
  HomeViewModel(
    this.getAllCatsPaginatedUseCase,
    this.listenAllCatsUseCase,
    this.setAllCatsUseCase,
  ) {
    _initListeners();
  }

  String _searchQuery = 'go';
  List<Cat> _catsList = [];

  static const int _pageSize = 10;
  bool _scrolled = false;

  final PagingController<int, Cat> _pagingController =
      PagingController(firstPageKey: 0);
  final ScrollController _scrollController = ScrollController();
  late StreamSubscription _catsListStreamSubscripber;

  void _initListeners() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    _scrollController.addListener(() {
      final ScrollPosition position = _scrollController.position;
      _scrolled = position.pixels > 50;
      notifyListeners();
    });
    _catsListStreamSubscripber =
        listenAllCatsUseCase(NoParam()).listen((value) {
      print('Value from controller: $value');
      _catsList = value;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _catsListStreamSubscripber.cancel();
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
      setAllCatsUseCase(
          SetCatsListParams(list: _pagingController.value.itemList));
    }
  }

  String get searchQuery => _searchQuery;
  List<Cat> get catsList => _catsList;
  bool get scrolled => _scrolled;
  PagingController<int, Cat> get pagingController => _pagingController;
  ScrollController get scrollController => _scrollController;
}

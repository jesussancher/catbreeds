import 'dart:async';
import 'dart:math';

import 'package:catbreeds/domain/domain.dart';
import 'package:catbreeds/presentation/presentation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends BaseViewModel {
  final FetchAllCatsPaginatedUseCase _fetchAllCatsPaginatedUseCase;
  final SetAllCatsUseCase _setAllCatsUseCase;

  HomeViewModel(
    this._fetchAllCatsPaginatedUseCase,
    this._setAllCatsUseCase,
  ) {
    _initListeners();
  }

  String _dummyCatName = 'Search for your prefurrrred cat breeds';
  List<Cat> _catsList = [];
  bool _scrolled = false;

  static const int _pageSize = 10;
  Timer? timer;

  final PagingController<int, Cat> _pagingController =
      PagingController(firstPageKey: 0);
  final ScrollController _scrollController = ScrollController();

  void _initListeners() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    _scrollController.addListener(() {
      final ScrollPosition position = _scrollController.position;
      _scrolled = position.pixels > 50;
      notifyListeners();
    });
  }

  Future<void> _fetchPage(int pageNumber) async {
    final Response<List<Cat>> response = await _fetchAllCatsPaginatedUseCase(
        AllCatsParams(limit: '10', page: pageNumber.toString()));
    if (response.succeeded) {
      final List<Cat> cats = response.success?.data ?? [];
      final isLastPage = cats.length < _pageSize;

      if (isLastPage) {
        _pagingController.appendLastPage(cats);
      } else {
        _pagingController.appendPage(cats, pageNumber + 1);
      }

      _initRandomizeDummyCatName(cats);
      await _setAllCatsUseCase(SetCatsListParams(list: cats));
    }
  }

  void _initRandomizeDummyCatName(List<Cat> list) {
    if (list.isEmpty) return;
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 5), (_) {
      final int randomIndex = Random().nextInt(list.length - 1);
      final Cat randomizedCat = list.elementAt(randomIndex);
      _dummyCatName = randomizedCat.name ?? '';
      notifyListeners();
    });
  }

  void goToSearchView(BuildContext context) {
    Navigator.of(context).pushNamed('/search');
  }

  String get dummyCatName => _dummyCatName;
  List<Cat> get catsList => _catsList;
  bool get scrolled => _scrolled;
  PagingController<int, Cat> get pagingController => _pagingController;
  ScrollController get scrollController => _scrollController;
}

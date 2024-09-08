import 'dart:async';

import 'package:catbreeds/core/network/http_client.dart';
import 'package:catbreeds/data/models/cat.dart';
import 'package:catbreeds/presentation/base_viewmodel.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeViewModel extends BaseViewmodel {
  HomeViewModel() {
    _initListeners();
  }

  String _searchQuery = 'go';
  List<Cat> _catsList = [];

  static const int _pageSize = 20;

  final PagingController<int, Cat> _pagingController =
      PagingController(firstPageKey: 0);

  void _initListeners() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final List<Cat> newItems = [];
      final client = HttpClient();
      client.get(url: 'https://api.thecatapi.com/v1/breeds');
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  // final StreamController<User> _userController = StreamController<User>();
  // Stream<User> get userStream => _userController.stream;

  // // Business logic and data transformation
  // void updateUserAge(User user, int newAge) {
  //   final updatedUser = User(name: user.name, age: newAge);
  //   _userController.add(updatedUser);
  // }

  // // Dispose the controller to avoid memory leaks
  // void dispose() {
  //   _userController.close();
  // }

  String get searchQuery => _searchQuery;
  List<Cat> get catsList => _catsList;
  PagingController<int, Cat> get pagingController => _pagingController;
}

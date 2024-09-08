import 'dart:async';

import 'package:catbreeds/data/models/cat.dart';
import 'package:catbreeds/presentation/base_viewmodel.dart';

class HomeViewModel extends BaseViewmodel {
  String _searchQuery = 'go';
  List<Cat> _catsList = [];
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
}

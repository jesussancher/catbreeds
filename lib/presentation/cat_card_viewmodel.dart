import 'package:catbreeds/presentation/presentation.dart';
import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/ui/pages/detail_view.dart';
import 'package:flutter/material.dart';

/// ViewModel for managing the state and navigation of cat cards.
class CatCardViewModel extends BaseViewModel {
  /// Navigates to the detail view of a specific cat.
  ///
  /// [context] is the BuildContext used for navigation.
  /// [cat] is the Cat object to display in the detail view.
  void goToDetail(BuildContext context, Cat cat) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => DetailView(cat),
      ),
    );
  }
}

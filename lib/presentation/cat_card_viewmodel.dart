import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/presentation/base_viewmodel.dart';
import 'package:catbreeds/ui/pages/detail_view.dart';
import 'package:flutter/material.dart';

class CatCardViewModel extends BaseViewModel {
  void goToDetail(BuildContext context, Cat cat) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => DetailView(cat),
      ),
    );
  }
}

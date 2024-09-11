import 'dart:async';

import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/cat_image_params.dart';
import 'package:catbreeds/domain/models/cat_image_url_params.dart';
import 'package:catbreeds/domain/models/network/response.dart';
import 'package:catbreeds/domain/usecases/get_cat_image_url_by_id_usecase.dart';
import 'package:catbreeds/domain/usecases/fetch_cat_image_url_usecase.dart';
import 'package:catbreeds/presentation/base_viewmodel.dart';
import 'package:catbreeds/ui/pages/detail_view.dart';
import 'package:flutter/material.dart';

class CatCardViewModel extends BaseViewModel {
  final FetchCatImageUrlUseCase _fetchCatImageUrlUseCase;
  final GetCatImageUrlByIdUseCase _getCatImageUrlByIdUseCase;

  CatCardViewModel(
    this._fetchCatImageUrlUseCase,
    this._getCatImageUrlByIdUseCase,
  );

  Future<String?> getCatImage(Cat cat) async {
    if (cat.imageUrlJPG != null) {
      return cat.imageUrlJPG;
    }
    final String? imageUrl =
        await _getCatImageUrlByIdUseCase(CatImageUrlParams(id: cat.id));

    if (imageUrl != null) return imageUrl;
    if (cat.referenceImageId == null || cat.id == null) return null;
    final Response<String> response = await _fetchCatImageUrlUseCase(
        CatImageParams(
            referenceImageId: cat.referenceImageId!, catId: cat.id!));
    if (response.succeeded) {
      final String? url = response.success?.data;
      return url;
    }
    return null;
  }

  void goToDetail(BuildContext context, Cat cat) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => DetailView(cat),
      ),
    );
  }
}

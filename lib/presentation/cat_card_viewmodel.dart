import 'dart:async';

import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/cat_image_params.dart';
import 'package:catbreeds/domain/models/cat_image_url_params.dart';
import 'package:catbreeds/domain/models/network/response.dart';
import 'package:catbreeds/domain/usecases/get_cat_image_url_by_id_usecase.dart';
import 'package:catbreeds/domain/usecases/fetch_cat_image_url_usecase.dart';
import 'package:catbreeds/domain/usecases/set_cat_image_url_by_id_usecase.dart';
import 'package:catbreeds/presentation/base_viewmodel.dart';

class CatCardViewModel extends BaseViewModel {
  final FetchCatImageUrlUseCase fetchCatImageUrlUseCase;
  final SetCatImageUrlByIdUseCase setCatImageUrlByIdUseCase;
  final GetCatImageUrlByIdUseCase getCatImageUrlByIdUseCase;

  CatCardViewModel(
    this.fetchCatImageUrlUseCase,
    this.setCatImageUrlByIdUseCase,
    this.getCatImageUrlByIdUseCase,
  );

  Future<String?> getCatImage(Cat cat) async {
    final String? imageUrl = await getImageUrl(cat.id);
    if (imageUrl != null) return imageUrl;
    if (cat.referenceImageId == null || cat.id == null) return null;
    final Response<String> response = await fetchCatImageUrlUseCase(
        CatImageParams(
            referenceImageId: cat.referenceImageId!, catId: cat.id!));
    if (response.succeeded) {
      final String? url = response.success?.data;
      return url;
    }
    return null;
  }

  Future<String?> getImageUrl(String? id) async =>
      await getCatImageUrlByIdUseCase(CatImageUrlParams(id: id));
}

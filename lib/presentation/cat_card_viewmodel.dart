import 'dart:async';

import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/cat_image_params.dart';
import 'package:catbreeds/domain/models/cat_image_url_params.dart';
import 'package:catbreeds/domain/models/network/response.dart';
import 'package:catbreeds/domain/models/no_param.dart';
import 'package:catbreeds/domain/usecases/get_cat_image_url_by_id_usecase.dart';
import 'package:catbreeds/domain/usecases/fetch_cat_image_url_usecase.dart';
import 'package:catbreeds/domain/usecases/listen_all_cats_usecase.dart';
import 'package:catbreeds/domain/usecases/set_cat_image_url_by_id_usecase.dart';
import 'package:catbreeds/presentation/base_viewmodel.dart';

class CatCardViewModel extends BaseViewModel {
  final FetchCatImageUrlUseCase fetchCatImageUrlUseCase;
  final SetCatImageUrlByIdUseCase setCatImageUrlByIdUseCase;
  final GetCatImageUrlByIdUseCase getCatImageUrlByIdUseCase;
  final ListenAllCatsUseCase listenAllCatsUseCase;
  CatCardViewModel(
    this.fetchCatImageUrlUseCase,
    this.setCatImageUrlByIdUseCase,
    this.getCatImageUrlByIdUseCase,
    this.listenAllCatsUseCase,
  );

  late StreamSubscription<List<Cat>> _catsUpdateStreamSubscription;

  @override
  void dispose() {
    super.dispose();
    _catsUpdateStreamSubscription.cancel();
  }

  Future<void> getCatImage(Cat cat) async {
    print('GETTING IMAGEID:  ${cat.name}: ${await getImageUrl(cat.id)}');
    if (cat.referenceImageId == null || cat.id == null) return;
    final Response<String> response = await fetchCatImageUrlUseCase(
        CatImageParams(
            referenceImageId: cat.referenceImageId!, catId: cat.id!));
    if (response.succeeded) {
      final String? url = response.success?.data;
      setCatImageUrlByIdUseCase(CatImageUrlParams(id: cat.id, url: url));
      notifyListeners();
    }
  }

  Future<String?> getImageUrl(String? id) async {
    return await getCatImageUrlByIdUseCase(CatImageUrlParams(id: id));
  }
}

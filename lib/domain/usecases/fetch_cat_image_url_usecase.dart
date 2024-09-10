import 'package:catbreeds/domain/models/cat_image_params.dart';
import 'package:catbreeds/domain/models/cat_image_url_params.dart';
import 'package:catbreeds/domain/models/network/response.dart';
import 'package:catbreeds/domain/repositories/i_cats_local_repository.dart';
import 'package:catbreeds/domain/repositories/i_cats_remote_repository.dart';
import 'package:catbreeds/domain/usecases/core/future_query_usecase.dart';

class FetchCatImageUrlUseCase
    extends FutureQueryUseCase<Response<String>, CatImageParams> {
  final ICatsRemoteRepository remoteRepository;
  final ICatsLocalRepository localRepository;

  FetchCatImageUrlUseCase(
    this.remoteRepository,
    this.localRepository,
  );

  @override
  Future<Response<String>> call(CatImageParams params) async {
    final bool isInQeue = await localRepository
        .getCatIsInQeue(CatImageUrlParams(id: params.catId));

    if (isInQeue) {
      return Response(
          error: ResponseError(errorMessage: 'Cat is already in qeue'));
    }
    await localRepository
        .setGettingImageQeueList(CatImageUrlParams(id: params.catId));
    final Response<String> resposne =
        await remoteRepository.fetchCatImageUrl(params);
    final String? imageUlr = resposne.success?.data;
    await localRepository
        .setCatImageUrlById(CatImageUrlParams(id: params.catId, url: imageUlr));

    return resposne;
  }
}

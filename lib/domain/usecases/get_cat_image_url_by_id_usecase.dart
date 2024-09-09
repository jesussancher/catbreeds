import 'package:catbreeds/domain/models/cat_image_url_params.dart';
import 'package:catbreeds/domain/repositories/i_cats_local_repository.dart';
import 'package:catbreeds/domain/usecases/core/future_query_usecase.dart';

class GetCatImageUrlByIdUseCase
    extends FutureQueryUseCase<String?, CatImageUrlParams> {
  final ICatsLocalRepository repository;

  GetCatImageUrlByIdUseCase(this.repository);

  @override
  Future<String?> call(CatImageUrlParams params) async {
    return await repository.getCatImageUrlById(params);
  }
}

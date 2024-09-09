import 'package:catbreeds/domain/models/cat_image_url_params.dart';
import 'package:catbreeds/domain/repositories/i_cats_local_repository.dart';
import 'package:catbreeds/domain/usecases/core/future_command_usecase.dart';

class SetCatImageUrlByIdUseCase
    extends FutureCommandUseCase<CatImageUrlParams> {
  final ICatsLocalRepository repository;

  SetCatImageUrlByIdUseCase(this.repository);

  @override
  Future<void> call(CatImageUrlParams params) {
    return repository.setCatImageUrlById(params);
  }
}

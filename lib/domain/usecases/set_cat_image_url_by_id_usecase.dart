import 'package:catbreeds/domain/models/cat_image_url_params.dart';
import 'package:catbreeds/domain/repositories/i_cats_local_repository.dart';
import 'package:catbreeds/domain/usecases/core/command_usecase.dart';

class SetCatImageUrlByIdUseCase extends CommandUseCase<CatImageUrlParams> {
  final ICatsLocalRepository repository;

  SetCatImageUrlByIdUseCase(this.repository);

  @override
  void call(CatImageUrlParams params) {
    return repository.setCatImageUrlById(params);
  }
}

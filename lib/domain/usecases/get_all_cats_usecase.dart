import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/params/no_param.dart';
import 'package:catbreeds/domain/repositories/i_cats_local_repository.dart';
import 'package:catbreeds/domain/usecases/core/future_query_usecase.dart';

class GetAllCatsUseCase extends FutureQueryUseCase<List<Cat>, NoParam> {
  final ICatsLocalRepository repository;

  GetAllCatsUseCase(this.repository);

  @override
  Future<List<Cat>> call(NoParam params) async {
    return repository.getAllCatsList();
  }
}

import 'package:catbreeds/domain/domain.dart';

class GetAllCatsUseCase extends FutureQueryUseCase<List<Cat>, NoParam> {
  final ICatsLocalRepository repository;

  GetAllCatsUseCase(this.repository);

  @override
  Future<List<Cat>> call(NoParam params) async {
    return repository.getAllCatsList();
  }
}

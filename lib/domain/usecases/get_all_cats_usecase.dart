import 'package:catbreeds/domain/domain.dart';

/// Use case for retrieving the list of all cats from the local repository.
class GetAllCatsUseCase extends FutureQueryUseCase<List<Cat>, NoParam> {
  final ICatsLocalRepository repository;

  /// Constructs [GetAllCatsUseCase] with the given [repository].
  GetAllCatsUseCase(this.repository);

  /// Executes the use case to get the list of all cats.
  ///
  /// [params] is ignored as no parameters are needed.
  /// Retrieves the list of cats from the local repository.
  @override
  Future<List<Cat>> call(NoParam params) async {
    return repository.getAllCatsList();
  }
}

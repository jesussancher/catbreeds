import 'package:catbreeds/domain/domain.dart';

/// Use case for setting a list of all cats in the local repository.
class SetAllCatsUseCase extends FutureCommandUseCase<SetCatsListParams> {
  final ICatsLocalRepository repository;

  /// Constructs [SetAllCatsUseCase] with the given [repository].
  SetAllCatsUseCase(this.repository);

  /// Executes the use case to set a list of all cats.
  ///
  /// [params] Contains the list of cats to be set.
  /// If [params.list] is `null`, the operation is skipped.
  @override
  Future<void> call(SetCatsListParams params) async {
    if (params.list == null) return;
    return await repository.setAllCatsList(params);
  }
}

import 'package:catbreeds/domain/domain.dart';

class SetAllCatsUseCase extends FutureCommandUseCase<SetCatsListParams> {
  final ICatsLocalRepository repository;

  SetAllCatsUseCase(this.repository);

  @override
  Future<void> call(SetCatsListParams params) async {
    if (params.list == null) return;
    return await repository.setAllCatsList(params);
  }
}

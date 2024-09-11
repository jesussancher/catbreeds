import 'package:catbreeds/domain/models/set_cats_list_params.dart';
import 'package:catbreeds/domain/repositories/i_cats_local_repository.dart';

import 'package:catbreeds/domain/usecases/core/future_command_usecase.dart';

class SetAllCatsUseCase extends FutureCommandUseCase<SetCatsListParams> {
  final ICatsLocalRepository repository;

  SetAllCatsUseCase(this.repository);

  @override
  Future<void> call(SetCatsListParams params) async {
    if (params.list == null) return;
    return await repository.setAllCatsList(params.list!);
  }
}

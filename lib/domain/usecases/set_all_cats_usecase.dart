import 'package:catbreeds/domain/models/set_cats_list_params.dart';
import 'package:catbreeds/domain/repositories/i_cats_local_repository.dart';

import 'package:catbreeds/domain/usecases/core/command_usecase.dart';

class SetAllCatsUseCase extends CommandUseCase<SetCatsListParams> {
  final ICatsLocalRepository repository;

  SetAllCatsUseCase(this.repository);

  @override
  void call(SetCatsListParams params) {
    if (params.list == null) return;
    return repository.setCatsList(params.list!);
  }
}

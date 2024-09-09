import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/no_param.dart';
import 'package:catbreeds/domain/repositories/i_cats_remote_repository.dart';

import 'package:catbreeds/domain/usecases/core/stream_usecase.dart';

class ListenAllCatsUseCase extends StreamUseCase<List<Cat>, NoParam> {
  final ICatsRemoteRepository repository;

  ListenAllCatsUseCase(this.repository);

  @override
  Stream<List<Cat>> call(NoParam params) {
    // return repository.listenCatsList();
    return Stream.empty();
  }
}

import 'package:catbreeds/domain/models/all_cats_params.dart';
import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/network/response.dart';
import 'package:catbreeds/domain/repositories/i_cats_remote_repository.dart';
import 'package:catbreeds/domain/usecases/core/future_query_usecase.dart';

class FetchAllCatsPaginatedUseCase
    extends FutureQueryUseCase<Response<List<Cat>>, AllCatsParams> {
  final ICatsRemoteRepository repository;

  FetchAllCatsPaginatedUseCase(this.repository);

  @override
  Future<Response<List<Cat>>> call(AllCatsParams params) async {
    return await repository.fetchCatsPaginated(params);
  }
}

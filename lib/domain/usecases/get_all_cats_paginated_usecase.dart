import 'package:catbreeds/domain/models/all_cats_params.dart';
import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/network/response.dart';
import 'package:catbreeds/domain/repositories/i_cats_repository.dart';
import 'package:catbreeds/domain/usecases/future_query_usecase.dart';

class GetAllCatsPaginatedUseCase
    extends FutureQueryUseCase<Response<List<Cat>>, AllCatsParams> {
  final ICatsRepository repository;

  GetAllCatsPaginatedUseCase(this.repository);

  @override
  Future<Response<List<Cat>>> call(AllCatsParams params) async {
    return await repository.getCatsPaginated(params);
  }
}

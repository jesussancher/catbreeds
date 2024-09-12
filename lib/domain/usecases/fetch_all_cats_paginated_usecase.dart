import 'package:catbreeds/domain/domain.dart';

class FetchAllCatsPaginatedUseCase
    extends FutureQueryUseCase<Response<List<Cat>>, AllCatsParams> {
  final ICatsRemoteRepository repository;

  FetchAllCatsPaginatedUseCase(this.repository);

  @override
  Future<Response<List<Cat>>> call(AllCatsParams params) async {
    return await repository.fetchCatsPaginated(params);
  }
}

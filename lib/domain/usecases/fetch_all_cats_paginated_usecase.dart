import 'package:catbreeds/domain/domain.dart';

/// Use case for fetching a paginated list of cats from the remote repository.
class FetchAllCatsPaginatedUseCase
    extends FutureQueryUseCase<Response<List<Cat>>, AllCatsParams> {
  final ICatsRemoteRepository repository;

  /// Constructs [FetchAllCatsPaginatedUseCase] with the given [repository].
  FetchAllCatsPaginatedUseCase(this.repository);

  /// Executes the use case to fetch a paginated list of cats.
  ///
  /// [params] contains pagination parameters.
  /// Retrieves a paginated list of cats from the remote repository.
  @override
  Future<Response<List<Cat>>> call(AllCatsParams params) async {
    return await repository.fetchCatsPaginated(params);
  }
}

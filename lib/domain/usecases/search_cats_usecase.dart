import 'package:catbreeds/domain/domain.dart';

/// Use case for searching cats by name, utilizing both remote and local repositories.
class SearchCatsUseCase
    extends FutureQueryUseCase<Response<List<Cat>>, SearchParams> {
  final ICatsRemoteRepository remoteRepository;
  final ICatsLocalRepository localRepository;

  /// Constructs [SearchCatsUseCase] with the given [remoteRepository] and [localRepository].
  SearchCatsUseCase(
    this.remoteRepository,
    this.localRepository,
  );

  /// Executes the use case to search for cats by name.
  ///
  /// [params] Contains search parameters including the query.
  /// If the query is empty, returns an empty list.
  /// Searches in the local repository first, if not found, fetches from the remote repository.
  /// Adds fetched results to the local repository if successful.
  @override
  Future<Response<List<Cat>>> call(SearchParams params) async {
    if (params.q?.isEmpty == true) {
      return Response(success: ResponseSuccess(data: []));
    }

    // Search in local repository
    final List<Cat> localResult =
        await localRepository.searchCatsByName(params);
    if (localResult.isNotEmpty) {
      return Response(
        success: ResponseSuccess<List<Cat>>.fromResponse(
          data: localResult,
        ),
      );
    }

    // Fetch from remote repository
    final Response<List<Cat>> response =
        await remoteRepository.searchCatsById(params);
    if (response.succeeded) {
      localRepository.addCatsToListFromSearch(
          SetCatsListParams(list: response.success?.data));
    }

    return response;
  }
}

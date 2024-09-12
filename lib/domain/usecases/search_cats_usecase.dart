import 'package:catbreeds/domain/domain.dart';

class SearchCatsdUseCase
    extends FutureQueryUseCase<Response<List<Cat>>, SearchParams> {
  final ICatsRemoteRepository remoteRepository;
  final ICatsLocalRepository localRepository;

  SearchCatsdUseCase(
    this.remoteRepository,
    this.localRepository,
  );

  @override
  Future<Response<List<Cat>>> call(SearchParams params) async {
    if (params.q?.isEmpty == true) {
      return Response(success: ResponseSuccess(data: []));
    }
    final List<Cat> localResult =
        await localRepository.searchCatsByName(params);
    if (localResult.isNotEmpty) {
      final Response<List<Cat>> response = Response(
        success: ResponseSuccess<List<Cat>>.fromResponse(
          data: localResult,
        ),
      );

      return response;
    }

    final Response<List<Cat>> response =
        await remoteRepository.searchCatsById(params);
    if (response.succeeded) {
      localRepository.addCatsToListFromSearch(
          SetCatsListParams(list: response.success?.data));
    }

    return response;
  }
}

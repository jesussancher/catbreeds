import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/cat_image_params.dart';
import 'package:catbreeds/domain/models/network/response.dart';
import 'package:catbreeds/domain/models/search_params.dart';
import 'package:catbreeds/domain/repositories/i_cats_local_repository.dart';
import 'package:catbreeds/domain/repositories/i_cats_remote_repository.dart';
import 'package:catbreeds/domain/usecases/core/future_query_usecase.dart';

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
      localRepository.addCatsToListFromSearch(response.success?.data);
    }

    return response;
  }
}

import 'package:catbreeds/core/core.dart';
import 'package:catbreeds/data/data_sources/data_sources.dart';
import 'package:catbreeds/domain/domain.dart';

/// Implements [ICatsRemoteApi] for fetching and searching cat data from a remote source.
class CatsRemoteApi implements ICatsRemoteApi {
  final IHttpClient httpClient;

  /// Creates an instance of [CatsRemoteApi] with the provided [httpClient].
  const CatsRemoteApi(this.httpClient);

  @override
  Future<Response<List<Cat>>> fetchCatsPaginated(AllCatsParams params) async {
    try {
      final response = await httpClient.get<List<Cat>>(
        url: BaseUrl.getAllCats,
        params: params,
      );

      return response.fold(
        (error) => Response(error: error),
        (success) {
          final List<Cat>? catsList =
              (success.originalData?['data'] as List<dynamic>?)
                  ?.map((json) => Cat.fromJson(json))
                  .toList();

          return Response(
            success: ResponseSuccess<List<Cat>>.fromResponse(
              data: catsList ?? [],
              response: success,
            ),
          );
        },
      );
    } on ResponseError catch (e) {
      return Response(error: ResponseError(errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Response<List<Cat>>> searchCatsById(SearchParams params) async {
    try {
      final response = await httpClient.get<List<Cat>>(
        url: BaseUrl.searchCats,
        params: params,
      );

      return response.fold(
        (error) => Response(error: error),
        (success) {
          final List<Cat>? catsList =
              (success.originalData?['data'] as List<dynamic>?)
                  ?.map((json) => Cat.fromJson(json))
                  .toList();

          return Response(
            success: ResponseSuccess<List<Cat>>.fromResponse(
              data: catsList ?? [],
              response: success,
            ),
          );
        },
      );
    } on ResponseError catch (e) {
      return Response(error: ResponseError(errorMessage: e.errorMessage));
    }
  }
}

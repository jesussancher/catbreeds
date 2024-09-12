import 'package:catbreeds/core/network/base_url.dart';
import 'package:catbreeds/core/network/i_http_client.dart';
import 'package:catbreeds/data/data_sources/remote/i_cats_remote_api.dart';
import 'package:catbreeds/domain/models/params/all_cats_params.dart';
import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/network/response.dart';
import 'package:catbreeds/domain/models/params/search_params.dart';

class CatsRemoteApi implements ICatsRemoteApi {
  final IHttpClient httpClient;
  const CatsRemoteApi(
    this.httpClient,
  );

  @override
  Future<Response<List<Cat>>> fetchCatsPaginated(AllCatsParams params) async {
    try {
      final response = await httpClient.get<List<Cat>>(
          url: BaseUrl.getAllCats, params: params);

      return response.fold((error) {
        return Response(error: error);
      }, (success) {
        if (success.originalData == null) {
          return Response(
              success: ResponseSuccess<List<Cat>>.fromResponse(
                  data: [], response: success));
        }
        final List<Cat>? catsList =
            (success.originalData?['data'] as List<dynamic>?)
                ?.map((json) => Cat.fromJson(json))
                .toList();

        return Response(
            success: ResponseSuccess<List<Cat>>.fromResponse(
                data: catsList, response: success));
      });
    } on ResponseError catch (e) {
      return Response(error: ResponseError(errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Response<List<Cat>>> searchCatsById(SearchParams params) async {
    try {
      final response = await httpClient.get<List<Cat>>(
          url: BaseUrl.searchCats, params: params);

      return response.fold((error) {
        return Response(error: error);
      }, (success) {
        if (success.originalData == null) {
          return Response(
              success: ResponseSuccess<List<Cat>>.fromResponse(
                  data: [], response: success));
        }

        final List<Cat>? catsList =
            (success.originalData?['data'] as List<dynamic>?)
                ?.map((json) => Cat.fromJson(json))
                .toList();

        return Response(
            success: ResponseSuccess<List<Cat>>.fromResponse(
                data: catsList, response: success));
      });
    } on ResponseError catch (e) {
      return Response(error: ResponseError(errorMessage: e.errorMessage));
    }
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:catbreeds/core/network/i_http_client.dart';
import 'package:catbreeds/domain/models/network/params.dart';
import 'package:catbreeds/domain/models/network/response.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class HttpClient implements IHttpClient {
  String _addDynamicAddressParams(String tempUrl, Params? params) {
    return params != null
        ? params.toJson().entries.fold(tempUrl, (
            String previousUrl,
            MapEntry<String, dynamic> currentParam,
          ) {
            final String key = currentParam.key;
            final String value = currentParam.value.toString();
            return previousUrl.replaceAll('{$key}', value);
          })
        : tempUrl;
  }

  @override
  Future<Either<ResponseError, ResponseSuccess<T>>> get<T>(
      {required String url, Params? params}) async {
    final Uri uri = Uri.parse(_addDynamicAddressParams(url, params));
    final Uri uriWithQuery = uri.replace(queryParameters: params?.toJson());
    print('uriWithQuery:: ${uriWithQuery.toString()} / ${params?.toJson()}');
    try {
      final http.Response response = await http.get(
        uriWithQuery,
        headers: {'x-api-key': String.fromEnvironment('CAP_BREEDS_API_KEY')},
      );
      final data = jsonDecode(response.body);
      final ResponseSuccess<T> responseSuccess = ResponseSuccess(
        originalData: {'data': data},
        statusCode: response.statusCode,
      );

      return Right(responseSuccess);
    } catch (e) {
      throw ResponseError(errorMessage: e.toString());
    }
  }

  @override
  Future<Either<ResponseError, ResponseSuccess>> post(
      {required String url, required Map<String, dynamic> body}) async {
    final Uri uri = Uri.parse(url);
    try {
      final http.Response response = await http.post(uri, body: body);
      final data = jsonDecode(response.body);
      final ResponseSuccess responseSuccess =
          ResponseSuccess(originalData: data, statusCode: response.statusCode);
      return Right(responseSuccess);
    } catch (e) {
      return Left(ResponseError(
        errorMessage: e.toString(),
      ));
    }
  }
}

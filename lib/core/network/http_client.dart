import 'dart:convert';
import 'dart:io';

import 'package:catbreeds/core/network/i_http_client.dart';
import 'package:catbreeds/domain/models/network/response.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class HttpClient implements IHttpClient {
  @override
  Future<Either<ResponseError, ResponseSuccess>> get(
      {required String url, String? page = '1', String? limit = '10'}) async {
    final queryParams = {
      'order': 'Desc',
    };
    if (limit != null) {
      queryParams['limit'] = limit;
    }
    if (page != null) {
      queryParams['page'] = page;
    }
    final Uri uri = Uri.parse(url);
    final Uri uriWithQuery = uri.replace(queryParameters: queryParams);
    try {
      final http.Response response = await http.get(
        uriWithQuery,
        headers: {'x-api-key': String.fromEnvironment('CAP_BREEDS_API_KEY')},
      );
      final data = jsonDecode(response.body);
      final ResponseSuccess responseSuccess = ResponseSuccess(
          originalData: {'data': data}, statusCode: response.statusCode);

      return Right(responseSuccess);
    } catch (e) {
      return Left(ResponseError(
        errorMessage: e.toString(),
      ));
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

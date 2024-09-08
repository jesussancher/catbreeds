import 'dart:convert';

import 'package:catbreeds/core/network/i_http_client.dart';
import 'package:catbreeds/domain/models/network/response.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class HttpClient implements IHttpClient {
  @override
  Future<Either<ResponseError, ResponseSuccess>> get(
      {required String url}) async {
    final Uri uri = Uri.parse(url);
    try {
      print('GETTING');
      final http.Response response = await http.get(uri);
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

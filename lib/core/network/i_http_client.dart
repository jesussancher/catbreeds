import 'package:catbreeds/core/network/base_url.dart';
import 'package:catbreeds/domain/models/network/response.dart';
import 'package:dartz/dartz.dart';

abstract class IHttpClient {
  /// HTTP Get Method
  Future<Either<ResponseError, ResponseSuccess>> get({required String url});

  /// HTTP Post Method
  Future<Either<ResponseError, ResponseSuccess>> post(
      {required String url, required Map<String, dynamic> body});
}

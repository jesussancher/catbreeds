import 'package:catbreeds/domain/models/params/params.dart';
import 'package:catbreeds/domain/models/network/response.dart';
import 'package:dartz/dartz.dart';

abstract class IHttpClient {
  /// HTTP Get Method
  Future<Either<ResponseError, ResponseSuccess<T>>> get<T>(
      {required String url, Params? params});
}

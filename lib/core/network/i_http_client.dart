import 'package:catbreeds/domain/models/params/params.dart';
import 'package:catbreeds/domain/models/network/response.dart';
import 'package:dartz/dartz.dart';

/// Interface for making HTTP GET requests.
abstract class IHttpClient {
  /// Sends a GET request to the specified [url].
  ///
  /// Optionally accepts [params] for query parameters. Returns either a
  /// [ResponseError] or a [ResponseSuccess] containing the data of type [T].
  Future<Either<ResponseError, ResponseSuccess<T>>> get<T>(
      {required String url, Params? params});
}

import 'dart:convert';
import 'package:catbreeds/core/network/i_http_client.dart';
import 'package:catbreeds/domain/models/params/params.dart';
import 'package:catbreeds/domain/models/network/response.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

/// Implementation of the [IHttpClient] for handling HTTP GET requests.
class HttpClient implements IHttpClient {
  /// Replaces dynamic parameters in [tempUrl] with values from [params].
  ///
  /// If [params] is provided, it inserts its key-value pairs into the URL's
  /// placeholders, else returns the [tempUrl] unchanged.
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

  /// Sends an HTTP GET request to the given [url], optionally using [params].
  ///
  /// If dynamic URL parameters exist, they are replaced by values from [params].
  /// The API key is set in the headers. Returns either [ResponseSuccess] with
  /// parsed data or throws a [ResponseError].
  @override
  Future<Either<ResponseError, ResponseSuccess<T>>> get<T>({
    required String url,
    Params? params,
  }) async {
    final bool hasDynamicParams = url.contains('{');
    final Uri uri = Uri.parse(_addDynamicAddressParams(url, params));
    final Uri uriWithQuery =
        hasDynamicParams ? uri : uri.replace(queryParameters: params?.toJson());

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
}

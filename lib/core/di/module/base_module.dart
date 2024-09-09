import 'package:catbreeds/core/network/http_client.dart';
import 'package:catbreeds/core/network/i_http_client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class BaseModule {
  IHttpClient get httpClient => HttpClient();
}

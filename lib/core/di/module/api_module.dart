import 'package:catbreeds/data/data_sources/local/cats_local_api.dart';
import 'package:catbreeds/data/data_sources/local/i_cats_local_api.dart';
import 'package:catbreeds/data/data_sources/remote/cats_remote_api.dart';
import 'package:catbreeds/data/data_sources/remote/i_cats_remote_api.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ApiModule {
  @Singleton(as: ICatsRemoteApi)
  CatsRemoteApi get catsRemoteApi;
  @Singleton(as: ICatsLocalApi)
  CatsLocalApi get catsLocalApi;
}

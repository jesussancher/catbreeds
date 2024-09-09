import 'package:catbreeds/data/data_sources/remote/cats_api.dart';
import 'package:catbreeds/data/data_sources/remote/i_cats_api.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ApiModule {
  @Singleton(as: ICatsApi)
  CatsApi get catsApi;
}

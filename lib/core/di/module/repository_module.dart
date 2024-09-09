import 'package:catbreeds/data/repositories/cats_repository.dart';
import 'package:catbreeds/domain/repositories/i_cats_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RepositoryModule {
  @Singleton(as: ICatsRepository)
  CatsRepository get catsRepository;
}

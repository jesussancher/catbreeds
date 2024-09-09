import 'package:catbreeds/data/repositories/local/cats_local_repository.dart';
import 'package:catbreeds/data/repositories/remote/cats_remote_repository.dart';
import 'package:catbreeds/domain/repositories/i_cats_local_repository.dart';
import 'package:catbreeds/domain/repositories/i_cats_remote_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RepositoryModule {
  @Singleton(as: ICatsRemoteRepository)
  CatsRemoteRepository get catsRemoteRepository;
  @Singleton(as: ICatsLocalRepository)
  CatsLocalRepository get catsLocalRepository;
}

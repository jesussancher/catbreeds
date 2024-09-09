import 'package:catbreeds/data/data_sources/remote/i_cats_api.dart';
import 'package:catbreeds/domain/models/all_cats_params.dart';
import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/network/response.dart';
import 'package:catbreeds/domain/repositories/i_cats_repository.dart';

class CatsRepository implements ICatsRepository {
  final ICatsApi catsApi;

  const CatsRepository(this.catsApi);

  @override
  Future<Response<List<Cat>>> getCatsPaginated(AllCatsParams params) {
    return catsApi.getCatsPaginated(params);
  }
}

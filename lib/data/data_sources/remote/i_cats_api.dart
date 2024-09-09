import 'package:catbreeds/domain/models/all_cats_params.dart';
import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/network/response.dart';

abstract class ICatsApi {
  Future<Response<List<Cat>>> getCatsPaginated(AllCatsParams params);
}

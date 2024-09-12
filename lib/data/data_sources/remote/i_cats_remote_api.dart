import 'package:catbreeds/domain/models/params/all_cats_params.dart';
import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/network/response.dart';
import 'package:catbreeds/domain/models/params/search_params.dart';

abstract class ICatsRemoteApi {
  /// Fetch cats paginated
  Future<Response<List<Cat>>> fetchCatsPaginated(AllCatsParams params);

  /// Search bats by id
  Future<Response<List<Cat>>> searchCatsById(SearchParams params);
}

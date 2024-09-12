import 'package:catbreeds/domain/models/params/all_cats_params.dart';
import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/network/response.dart';
import 'package:catbreeds/domain/models/params/search_params.dart';

/// Interface for remote cat data operations.
abstract class ICatsRemoteApi {
  /// Fetches a paginated list of cats.
  ///
  /// Returns a [Response] containing a list of [Cat] objects.
  Future<Response<List<Cat>>> fetchCatsPaginated(AllCatsParams params);

  /// Searches for cats by their IDs.
  ///
  /// Returns a [Response] containing a list of [Cat] objects.
  Future<Response<List<Cat>>> searchCatsById(SearchParams params);
}

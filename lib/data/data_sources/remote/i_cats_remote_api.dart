import 'package:catbreeds/domain/models/all_cats_params.dart';
import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/cat_image_params.dart';
import 'package:catbreeds/domain/models/network/response.dart';

abstract class ICatsRemoteApi {
  Future<Response<List<Cat>>> fetchCatsPaginated(AllCatsParams params);

  Future<Response<String>> fetchCatImageUrl(CatImageParams params);
}

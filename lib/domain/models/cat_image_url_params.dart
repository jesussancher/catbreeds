import 'package:catbreeds/domain/models/network/params.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat_image_url_params.g.dart';

@JsonSerializable()
class CatImageUrlParams extends Params {
  CatImageUrlParams({this.id, this.url});

  final String? id;
  final String? url;

  factory CatImageUrlParams.fromJson(Map<String, dynamic> json) =>
      _$CatImageUrlParamsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CatImageUrlParamsToJson(this);
}

import 'package:catbreeds/domain/models/network/params.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat_image_params.g.dart';

@JsonSerializable()
class CatImageParams extends Params {
  CatImageParams({required this.catId, required this.referenceImageId});

  final String catId;
  final String referenceImageId;

  factory CatImageParams.fromJson(Map<String, dynamic> json) =>
      _$CatImageParamsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CatImageParamsToJson(this);
}

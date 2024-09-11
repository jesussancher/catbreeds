import 'package:catbreeds/domain/models/network/params.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_params.g.dart';

@JsonSerializable()
class SearchParams extends Params {
  SearchParams({
    this.q,
    this.attachImage = '1',
  });

  final String? q;
  @JsonKey(name: 'attach_image')
  final String? attachImage;

  factory SearchParams.fromJson(Map<String, dynamic> json) =>
      _$SearchParamsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SearchParamsToJson(this);
}

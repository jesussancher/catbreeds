import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/params/params.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_cats_list_params.g.dart';

@JsonSerializable()
class SetCatsListParams extends Params {
  SetCatsListParams({required this.list});

  final List<Cat>? list;

  factory SetCatsListParams.fromJson(Map<String, dynamic> json) =>
      _$SetCatsListParamsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SetCatsListParamsToJson(this);
}

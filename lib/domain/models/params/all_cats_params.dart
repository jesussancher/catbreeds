import 'package:catbreeds/domain/models/params/params.dart';
import 'package:json_annotation/json_annotation.dart';

part 'all_cats_params.g.dart';

@JsonSerializable()
class AllCatsParams extends Params {
  AllCatsParams({this.page, this.limit});

  final String? page;
  final String? limit;

  factory AllCatsParams.fromJson(Map<String, dynamic> json) =>
      _$AllCatsParamsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AllCatsParamsToJson(this);
}

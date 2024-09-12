import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/domain/models/params/params.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_cats_list_params.g.dart';

/// Represents parameters for setting a list of cats.
@JsonSerializable()
class SetCatsListParams extends Params {
  /// Creates an instance of [SetCatsListParams].
  SetCatsListParams({required this.list});

  /// List of cats.
  final List<Cat>? list;

  /// Creates a [SetCatsListParams] instance from JSON.
  factory SetCatsListParams.fromJson(Map<String, dynamic> json) =>
      _$SetCatsListParamsFromJson(json);

  /// Converts the [SetCatsListParams] to JSON.
  @override
  Map<String, dynamic> toJson() => _$SetCatsListParamsToJson(this);
}

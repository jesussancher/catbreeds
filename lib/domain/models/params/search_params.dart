import 'package:catbreeds/domain/models/params/params.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_params.g.dart';

/// Represents parameters for searching cats.
@JsonSerializable()
class SearchParams extends Params {
  /// Creates an instance of [SearchParams].
  SearchParams({
    this.q,
    this.attachImage = '1',
  });

  final String? q; // Query for searching cats
  @JsonKey(name: 'attach_image')
  final String? attachImage; // Indicates whether to attach image ('1' for true)

  /// Creates an [SearchParams] instance from JSON.
  factory SearchParams.fromJson(Map<String, dynamic> json) =>
      _$SearchParamsFromJson(json);

  /// Converts the [SearchParams] to JSON.
  @override
  Map<String, dynamic> toJson() => _$SearchParamsToJson(this);
}

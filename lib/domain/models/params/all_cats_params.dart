import 'package:catbreeds/domain/models/params/params.dart';
import 'package:json_annotation/json_annotation.dart';

part 'all_cats_params.g.dart';

/// Represents parameters for fetching a paginated list of cats.
@JsonSerializable()
class AllCatsParams extends Params {
  /// Creates an instance of [AllCatsParams].
  AllCatsParams({this.page, this.limit});

  final String? page; // Page number for pagination
  final String? limit; // Number of items per page

  /// Creates an [AllCatsParams] instance from JSON.
  factory AllCatsParams.fromJson(Map<String, dynamic> json) =>
      _$AllCatsParamsFromJson(json);

  /// Converts the [AllCatsParams] to JSON.
  @override
  Map<String, dynamic> toJson() => _$AllCatsParamsToJson(this);
}

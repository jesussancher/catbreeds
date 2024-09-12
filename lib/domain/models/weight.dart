import 'package:json_annotation/json_annotation.dart';

part 'weight.g.dart';

/// Represents the weight of a cat in different units.
@JsonSerializable()
class Weight {
  final String? imperial; // Weight in imperial units (e.g., pounds)
  final String? metric; // Weight in metric units (e.g., kilograms)

  /// Creates a [Weight] instance.
  const Weight({this.imperial, this.metric});

  /// Creates a [Weight] from JSON.
  factory Weight.fromJson(Map<String, dynamic> json) => _$WeightFromJson(json);

  /// Converts the [Weight] to JSON.
  Map<String, dynamic> toJson() => _$WeightToJson(this);
}

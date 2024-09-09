import 'package:json_annotation/json_annotation.dart';

import 'package:catbreeds/domain/models/weight.dart';

part 'cat.g.dart';

@JsonSerializable()
class Cat {
  final Weight? weight;
  final String? id;
  final String? name;
  final String? origin;
  final String? description;
  @JsonKey(name: 'reference_image_id')
  final String? referenceImageId;
  @JsonKey(name: 'country_code')
  final String? countryCode;
  @JsonKey(name: 'life_span')
  final String? lifeSpan;
  final int? indoor;
  final int? lap;
  @JsonKey(name: 'alt_names')
  final String? altNames;
  final int? adaptability;
  @JsonKey(name: 'affection_level')
  final int? affectionLevel;
  @JsonKey(name: 'child_friendly')
  final int? childFriendly;
  @JsonKey(name: 'dog_friendly')
  final int? dogFriendly;
  @JsonKey(name: 'energy_level')
  final int? energyLevel;
  final int? grooming;
  @JsonKey(name: 'health_issues')
  final int? healthIssues;
  final int? intelligence;
  @JsonKey(name: 'shedding_level')
  final int? sheddingLevel;
  @JsonKey(name: 'social_needs')
  final int? socialNeeds;
  @JsonKey(name: 'strager_friendly')
  final int? strangerFriendly;
  final int? vocalisation;
  final int? experimental;
  final int? hairless;
  final int? natural;
  final int? rare;
  final int? rex;
  @JsonKey(name: 'suppresed_tail')
  final int? suppresedTail;
  @JsonKey(name: 'short_legs')
  final int? shortLegs;
  @JsonKey(name: 'wikipedia_url')
  final String? wikipediaUrl;
  final int? hypoallergenic;
  String? imageUrl;

  Cat({
    this.id,
    this.name,
    this.origin,
    this.description,
    this.referenceImageId,
    this.countryCode,
    this.lifeSpan,
    this.indoor,
    this.lap,
    this.altNames,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.grooming,
    this.healthIssues,
    this.intelligence,
    this.sheddingLevel,
    this.socialNeeds,
    this.strangerFriendly,
    this.vocalisation,
    this.experimental,
    this.hairless,
    this.natural,
    this.rare,
    this.rex,
    this.suppresedTail,
    this.shortLegs,
    this.wikipediaUrl,
    this.hypoallergenic,
    this.weight,
  });

  void setImageUrl(String? url) {
    imageUrl = url;
  }

  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);

  Map<String, dynamic> toJson() => _$CatToJson(this);
}

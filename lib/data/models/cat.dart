import 'package:json_annotation/json_annotation.dart';

import 'package:catbreeds/data/models/weight.dart';

part 'cat.g.dart';

@JsonSerializable()
class Cat {
  final Weight? weight;
  final String? id;
  final String? name;
  final String? origin;
  final String? description;
  final String? eferenceImageId;
  final String? countryCode;
  final String? lifeSpan;
  final bool? indoor;
  final bool? lap;
  final String? altNames;
  final int? adaptability;
  final int? affectionLevel;
  final int? childFriendly;
  final int? dogFriendly;
  final int? energyLevel;
  final int? grooming;
  final int? healthIssues;
  final int? intelligence;
  final int? sheddingLevel;
  final int? socialNeeds;
  final int? strangerFriendly;
  final int? vocalisation;
  final int? experimental;
  final int? hairless;
  final int? natural;
  final int? rare;
  final int? rex;
  final int? suppresedTail;
  final int? shortLegs;
  final String? wikipediaUrl;
  final int? hypoallergenic;

  const Cat(
      {this.id,
      this.name,
      this.origin,
      this.description,
      this.eferenceImageId,
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
      this.weight});

  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);

  Map<String, dynamic> toJson() => _$CatToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cat _$CatFromJson(Map<String, dynamic> json) => Cat(
      id: json['id'] as String?,
      name: json['name'] as String?,
      origin: json['origin'] as String?,
      description: json['description'] as String?,
      referenceImageId: json['reference_image_id'] as String?,
      countryCode: json['country_code'] as String?,
      lifeSpan: json['life_span'] as String?,
      indoor: (json['indoor'] as num?)?.toInt(),
      lap: (json['lap'] as num?)?.toInt(),
      altNames: json['alt_names'] as String?,
      adaptability: (json['adaptability'] as num?)?.toInt(),
      affectionLevel: (json['affection_level'] as num?)?.toInt(),
      childFriendly: (json['child_friendly'] as num?)?.toInt(),
      dogFriendly: (json['dog_friendly'] as num?)?.toInt(),
      energyLevel: (json['energy_level'] as num?)?.toInt(),
      grooming: (json['grooming'] as num?)?.toInt(),
      healthIssues: (json['health_issues'] as num?)?.toInt(),
      intelligence: (json['intelligence'] as num?)?.toInt(),
      sheddingLevel: (json['shedding_level'] as num?)?.toInt(),
      socialNeeds: (json['social_needs'] as num?)?.toInt(),
      strangerFriendly: (json['strager_friendly'] as num?)?.toInt(),
      vocalisation: (json['vocalisation'] as num?)?.toInt(),
      experimental: (json['experimental'] as num?)?.toInt(),
      hairless: (json['hairless'] as num?)?.toInt(),
      natural: (json['natural'] as num?)?.toInt(),
      rare: (json['rare'] as num?)?.toInt(),
      rex: (json['rex'] as num?)?.toInt(),
      suppresedTail: (json['suppresed_tail'] as num?)?.toInt(),
      shortLegs: (json['short_legs'] as num?)?.toInt(),
      wikipediaUrl: json['wikipedia_url'] as String?,
      hypoallergenic: (json['hypoallergenic'] as num?)?.toInt(),
      weight: json['weight'] == null
          ? null
          : Weight.fromJson(json['weight'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CatToJson(Cat instance) => <String, dynamic>{
      'weight': instance.weight,
      'id': instance.id,
      'name': instance.name,
      'origin': instance.origin,
      'description': instance.description,
      'reference_image_id': instance.referenceImageId,
      'country_code': instance.countryCode,
      'life_span': instance.lifeSpan,
      'indoor': instance.indoor,
      'lap': instance.lap,
      'alt_names': instance.altNames,
      'adaptability': instance.adaptability,
      'affection_level': instance.affectionLevel,
      'child_friendly': instance.childFriendly,
      'dog_friendly': instance.dogFriendly,
      'energy_level': instance.energyLevel,
      'grooming': instance.grooming,
      'health_issues': instance.healthIssues,
      'intelligence': instance.intelligence,
      'shedding_level': instance.sheddingLevel,
      'social_needs': instance.socialNeeds,
      'strager_friendly': instance.strangerFriendly,
      'vocalisation': instance.vocalisation,
      'experimental': instance.experimental,
      'hairless': instance.hairless,
      'natural': instance.natural,
      'rare': instance.rare,
      'rex': instance.rex,
      'suppresed_tail': instance.suppresedTail,
      'short_legs': instance.shortLegs,
      'wikipedia_url': instance.wikipediaUrl,
      'hypoallergenic': instance.hypoallergenic,
    };

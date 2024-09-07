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
      eferenceImageId: json['eferenceImageId'] as String?,
      countryCode: json['countryCode'] as String?,
      lifeSpan: json['lifeSpan'] as String?,
      indoor: json['indoor'] as bool?,
      lap: json['lap'] as bool?,
      altNames: json['altNames'] as String?,
      adaptability: (json['adaptability'] as num?)?.toInt(),
      affectionLevel: (json['affectionLevel'] as num?)?.toInt(),
      childFriendly: (json['childFriendly'] as num?)?.toInt(),
      dogFriendly: (json['dogFriendly'] as num?)?.toInt(),
      energyLevel: (json['energyLevel'] as num?)?.toInt(),
      grooming: (json['grooming'] as num?)?.toInt(),
      healthIssues: (json['healthIssues'] as num?)?.toInt(),
      intelligence: (json['intelligence'] as num?)?.toInt(),
      sheddingLevel: (json['sheddingLevel'] as num?)?.toInt(),
      socialNeeds: (json['socialNeeds'] as num?)?.toInt(),
      strangerFriendly: (json['strangerFriendly'] as num?)?.toInt(),
      vocalisation: (json['vocalisation'] as num?)?.toInt(),
      experimental: (json['experimental'] as num?)?.toInt(),
      hairless: (json['hairless'] as num?)?.toInt(),
      natural: (json['natural'] as num?)?.toInt(),
      rare: (json['rare'] as num?)?.toInt(),
      rex: (json['rex'] as num?)?.toInt(),
      suppresedTail: (json['suppresedTail'] as num?)?.toInt(),
      shortLegs: (json['shortLegs'] as num?)?.toInt(),
      wikipediaUrl: json['wikipediaUrl'] as String?,
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
      'eferenceImageId': instance.eferenceImageId,
      'countryCode': instance.countryCode,
      'lifeSpan': instance.lifeSpan,
      'indoor': instance.indoor,
      'lap': instance.lap,
      'altNames': instance.altNames,
      'adaptability': instance.adaptability,
      'affectionLevel': instance.affectionLevel,
      'childFriendly': instance.childFriendly,
      'dogFriendly': instance.dogFriendly,
      'energyLevel': instance.energyLevel,
      'grooming': instance.grooming,
      'healthIssues': instance.healthIssues,
      'intelligence': instance.intelligence,
      'sheddingLevel': instance.sheddingLevel,
      'socialNeeds': instance.socialNeeds,
      'strangerFriendly': instance.strangerFriendly,
      'vocalisation': instance.vocalisation,
      'experimental': instance.experimental,
      'hairless': instance.hairless,
      'natural': instance.natural,
      'rare': instance.rare,
      'rex': instance.rex,
      'suppresedTail': instance.suppresedTail,
      'shortLegs': instance.shortLegs,
      'wikipediaUrl': instance.wikipediaUrl,
      'hypoallergenic': instance.hypoallergenic,
    };

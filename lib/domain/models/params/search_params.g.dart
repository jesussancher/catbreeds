// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchParams _$SearchParamsFromJson(Map<String, dynamic> json) => SearchParams(
      q: json['q'] as String?,
      attachImage: json['attach_image'] as String? ?? '1',
    );

Map<String, dynamic> _$SearchParamsToJson(SearchParams instance) =>
    <String, dynamic>{
      'q': instance.q,
      'attach_image': instance.attachImage,
    };

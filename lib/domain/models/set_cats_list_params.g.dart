// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_cats_list_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetCatsListParams _$SetCatsListParamsFromJson(Map<String, dynamic> json) =>
    SetCatsListParams(
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => Cat.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SetCatsListParamsToJson(SetCatsListParams instance) =>
    <String, dynamic>{
      'list': instance.list,
    };

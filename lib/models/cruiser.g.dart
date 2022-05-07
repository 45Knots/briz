// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cruiser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cruiser _$$_CruiserFromJson(Map<String, dynamic> json) => _$_Cruiser(
      id: json['id'] as String,
      title: json['title'] as String,
      type: json['type'] as String,
      capacity: json['capacity'] as int? ?? 0,
      description: json['description'] as String? ?? "",
      defaultImage: json['defaultImage'] as String? ?? "",
    );

Map<String, dynamic> _$$_CruiserToJson(_$_Cruiser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'capacity': instance.capacity,
      'description': instance.description,
      'defaultImage': instance.defaultImage,
    };

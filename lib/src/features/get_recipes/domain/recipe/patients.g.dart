// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patients.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientsImpl _$$PatientsImplFromJson(Map<String, dynamic> json) =>
    _$PatientsImpl(
      json['id'] as int,
      json['name'] as String,
      json['image'] as String,
      json['json'] as String?,
    );

Map<String, dynamic> _$$PatientsImplToJson(_$PatientsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'json': instance.json,
    };

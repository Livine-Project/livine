// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      json['id'] as int?,
      json['username'] as String?,
      json['email'] as String?,
      json['patient'] as int?,
      json['isVegan'] as bool?,
      json['points'] as int?,
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'patient': instance.patient,
      'isVegan': instance.isVegan,
      'points': instance.points,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planner_domain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MealImpl _$$MealImplFromJson(Map<String, dynamic> json) => _$MealImpl(
      json['id'] as int,
      json['name'] as String,
      json['from_date'] == null
          ? null
          : DateTime.parse(json['from_date'] as String),
      json['to_date'] == null
          ? null
          : DateTime.parse(json['to_date'] as String),
    );

Map<String, dynamic> _$$MealImplToJson(_$MealImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'from_date': instance.from_date?.toIso8601String(),
      'to_date': instance.to_date?.toIso8601String(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Recipe _$$_RecipeFromJson(Map<String, dynamic> json) => _$_Recipe(
      json['id'] as int,
      json['ingridents'] as List<dynamic>,
      json['ingridents_in_arabic'] as List<dynamic>,
      json['directions'] as List<dynamic>,
      json['patient'] as String,
      json['patient_in_arabic'] as String,
      json['directions_in_arabic'] as List<dynamic>,
      json['name'] as String,
      json['name_in_arabic'] as String,
      json['imageURL'] as String,
      json['diff'] as String,
      json['isVegetarian'] as bool,
      json['time_taken'] as int,
      json['calories'] as int,
      json['video'] as String,
      json['video_in_arabic'] as String,
      json['created_at'] as String,
    );

Map<String, dynamic> _$$_RecipeToJson(_$_Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'ingridents': instance.ingridents,
      'ingridents_in_arabic': instance.ingridents_in_arabic,
      'directions': instance.directions,
      'patient': instance.patient,
      'patient_in_arabic': instance.patient_in_arabic,
      'directions_in_arabic': instance.directions_in_arabic,
      'name': instance.name,
      'name_in_arabic': instance.name_in_arabic,
      'imageURL': instance.imageURL,
      'diff': instance.diff,
      'isVegetarian': instance.isVegetarian,
      'time_taken': instance.time_taken,
      'calories': instance.calories,
      'video': instance.video,
      'video_in_arabic': instance.video_in_arabic,
      'created_at': instance.created_at,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Recipe _$$_RecipeFromJson(Map<String, dynamic> json) => _$_Recipe(
      json['id'] as int,
      json['name'] as String,
      json['name_in_arabic'] as String,
      json['type_in_arabic'] as String,
      json['imageURL'] as String,
      json['coverURL'] as String,
      json['rating'] as String,
      json['type'] as String,
      json['video'] as String,
      json['video_in_arabic'] as String,
      json['ingridents'] as List<dynamic>,
      json['difficulty'] as String,
      json['time_taken'] as int,
      json['calories'] as int,
      json['directions'] as List<dynamic>,
      json['directions_in_arabic'] as List<dynamic>,
      json['ingridents_in_arabic'] as List<dynamic>,
    );

Map<String, dynamic> _$$_RecipeToJson(_$_Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_in_arabic': instance.name_in_arabic,
      'type_in_arabic': instance.type_in_arabic,
      'imageURL': instance.imageURL,
      'coverURL': instance.coverURL,
      'rating': instance.rating,
      'type': instance.type,
      'video': instance.video,
      'video_in_arabic': instance.video_in_arabic,
      'ingridents': instance.ingridents,
      'difficulty': instance.difficulty,
      'time_taken': instance.time_taken,
      'calories': instance.calories,
      'directions': instance.directions,
      'directions_in_arabic': instance.directions_in_arabic,
      'ingridents_in_arabic': instance.ingridents_in_arabic,
    };

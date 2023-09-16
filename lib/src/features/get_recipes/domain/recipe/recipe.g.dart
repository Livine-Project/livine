// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Recipe _$$_RecipeFromJson(Map<String, dynamic> json) => _$_Recipe(
      json['id'] as int,
      json['ingridents'] as List<dynamic>,
      json['directions'] as List<dynamic>,
      json['patient'] as String,
      json['name'] as String,
      json['imageURL'] as String,
      json['difficulty'] as String,
      json['isVegetarian'] as bool,
      json['difficulty_image'] as String,
      json['time_taken'] as int,
      json['calories'] as int,
      json['video'] as String,
      json['created_at'] as String,
    );

Map<String, dynamic> _$$_RecipeToJson(_$_Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'ingridents': instance.ingridents,
      'directions': instance.directions,
      'patient': instance.patient,
      'name': instance.name,
      'imageURL': instance.imageURL,
      'difficulty': instance.difficulty,
      'isVegetarian': instance.isVegetarian,
      'difficulty_image': instance.difficulty_image,
      'time_taken': instance.time_taken,
      'calories': instance.calories,
      'video': instance.video,
      'created_at': instance.created_at,
    };

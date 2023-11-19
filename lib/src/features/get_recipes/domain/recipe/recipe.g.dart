// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeImpl _$$RecipeImplFromJson(Map<String, dynamic> json) => _$RecipeImpl(
      json['id'] as int,
      (json['ingridents'] as List<dynamic>).map((e) => e as String).toList(),
      (json['directions'] as List<dynamic>).map((e) => e as String).toList(),
      json['patient'] as String,
      json['name'] as String,
      json['imageURL'] as String,
      json['difficulty'] as String,
      json['isVegetarian'] as bool?,
      json['tag'] as List<dynamic>,
      json['difficulty_image'] as String,
      json['time_taken'] as int,
      json['calories'] as int,
      json['video'] as String,
      json['from_date'] == null
          ? null
          : DateTime.parse(json['from_date'] as String),
      json['to_date'] == null
          ? null
          : DateTime.parse(json['to_date'] as String),
      json['created_at'] as String,
    );

Map<String, dynamic> _$$RecipeImplToJson(_$RecipeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ingridents': instance.ingridents,
      'directions': instance.directions,
      'patient': instance.patient,
      'name': instance.name,
      'imageURL': instance.imageURL,
      'difficulty': instance.difficulty,
      'isVegetarian': instance.isVegetarian,
      'tag': instance.tag,
      'difficulty_image': instance.difficulty_image,
      'time_taken': instance.time_taken,
      'calories': instance.calories,
      'video': instance.video,
      'from_date': instance.from_date?.toIso8601String(),
      'to_date': instance.to_date?.toIso8601String(),
      'created_at': instance.created_at,
    };

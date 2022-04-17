// GENERATED CODE - DO NOT MODIFY BY HAND

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
      json['rating'] as String,
      json['type'] as String,
      json['video'] as String,
      json['video_in_arabic'] as String,
      json['ingridents'] as String,
      json['ingridents_in_arabic'] as String,
    );

Map<String, dynamic> _$$_RecipeToJson(_$_Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_in_arabic': instance.name_in_arabic,
      'type_in_arabic': instance.type_in_arabic,
      'imageURL': instance.imageURL,
      'rating': instance.rating,
      'type': instance.type,
      'video': instance.video,
      'video_in_arabic': instance.video_in_arabic,
      'ingridents': instance.ingridents,
      'ingridents_in_arabic': instance.ingridents_in_arabic,
    };

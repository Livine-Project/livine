// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Recipe _$$_RecipeFromJson(Map<String, dynamic> json) => _$_Recipe(
      json['id'] as int,
      json['name'] as String,
      json['imageURL'] as String,
      json['rating'] as String,
      json['type'] as String,
      json['video'] as String,
      json['ingridents'] as String,
    );

Map<String, dynamic> _$$_RecipeToJson(_$_Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageURL': instance.imageURL,
      'rating': instance.rating,
      'type': instance.type,
      'video': instance.video,
      'ingridents': instance.ingridents,
    };

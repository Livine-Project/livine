// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return _Recipe.fromJson(json);
}

/// @nodoc
mixin _$Recipe {
  int get id => throw _privateConstructorUsedError;
  set id(int value) => throw _privateConstructorUsedError;
  List<String> get ingridents => throw _privateConstructorUsedError;
  set ingridents(List<String> value) => throw _privateConstructorUsedError;
  List<String> get directions => throw _privateConstructorUsedError;
  set directions(List<String> value) => throw _privateConstructorUsedError;
  String get patient => throw _privateConstructorUsedError;
  set patient(String value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String get imageURL => throw _privateConstructorUsedError;
  set imageURL(String value) => throw _privateConstructorUsedError;
  String get difficulty => throw _privateConstructorUsedError;
  set difficulty(String value) => throw _privateConstructorUsedError;
  bool? get isVegetarian => throw _privateConstructorUsedError;
  set isVegetarian(bool? value) => throw _privateConstructorUsedError;
  List<dynamic> get tag => throw _privateConstructorUsedError;
  set tag(List<dynamic> value) => throw _privateConstructorUsedError;
  String get difficulty_image => throw _privateConstructorUsedError;
  set difficulty_image(String value) => throw _privateConstructorUsedError;
  int get time_taken => throw _privateConstructorUsedError;
  set time_taken(int value) => throw _privateConstructorUsedError;
  int get calories => throw _privateConstructorUsedError;
  set calories(int value) => throw _privateConstructorUsedError;
  String get video => throw _privateConstructorUsedError;
  set video(String value) => throw _privateConstructorUsedError;
  DateTime? get from_date => throw _privateConstructorUsedError;
  set from_date(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get to_date => throw _privateConstructorUsedError;
  set to_date(DateTime? value) => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  set created_at(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeCopyWith<Recipe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) =
      _$RecipeCopyWithImpl<$Res, Recipe>;
  @useResult
  $Res call(
      {int id,
      List<String> ingridents,
      List<String> directions,
      String patient,
      String name,
      String imageURL,
      String difficulty,
      bool? isVegetarian,
      List<dynamic> tag,
      String difficulty_image,
      int time_taken,
      int calories,
      String video,
      DateTime? from_date,
      DateTime? to_date,
      String created_at});
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res, $Val extends Recipe>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ingridents = null,
    Object? directions = null,
    Object? patient = null,
    Object? name = null,
    Object? imageURL = null,
    Object? difficulty = null,
    Object? isVegetarian = freezed,
    Object? tag = null,
    Object? difficulty_image = null,
    Object? time_taken = null,
    Object? calories = null,
    Object? video = null,
    Object? from_date = freezed,
    Object? to_date = freezed,
    Object? created_at = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ingridents: null == ingridents
          ? _value.ingridents
          : ingridents // ignore: cast_nullable_to_non_nullable
              as List<String>,
      directions: null == directions
          ? _value.directions
          : directions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      patient: null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      isVegetarian: freezed == isVegetarian
          ? _value.isVegetarian
          : isVegetarian // ignore: cast_nullable_to_non_nullable
              as bool?,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      difficulty_image: null == difficulty_image
          ? _value.difficulty_image
          : difficulty_image // ignore: cast_nullable_to_non_nullable
              as String,
      time_taken: null == time_taken
          ? _value.time_taken
          : time_taken // ignore: cast_nullable_to_non_nullable
              as int,
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int,
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String,
      from_date: freezed == from_date
          ? _value.from_date
          : from_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      to_date: freezed == to_date
          ? _value.to_date
          : to_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeImplCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$$RecipeImplCopyWith(
          _$RecipeImpl value, $Res Function(_$RecipeImpl) then) =
      __$$RecipeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      List<String> ingridents,
      List<String> directions,
      String patient,
      String name,
      String imageURL,
      String difficulty,
      bool? isVegetarian,
      List<dynamic> tag,
      String difficulty_image,
      int time_taken,
      int calories,
      String video,
      DateTime? from_date,
      DateTime? to_date,
      String created_at});
}

/// @nodoc
class __$$RecipeImplCopyWithImpl<$Res>
    extends _$RecipeCopyWithImpl<$Res, _$RecipeImpl>
    implements _$$RecipeImplCopyWith<$Res> {
  __$$RecipeImplCopyWithImpl(
      _$RecipeImpl _value, $Res Function(_$RecipeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ingridents = null,
    Object? directions = null,
    Object? patient = null,
    Object? name = null,
    Object? imageURL = null,
    Object? difficulty = null,
    Object? isVegetarian = freezed,
    Object? tag = null,
    Object? difficulty_image = null,
    Object? time_taken = null,
    Object? calories = null,
    Object? video = null,
    Object? from_date = freezed,
    Object? to_date = freezed,
    Object? created_at = null,
  }) {
    return _then(_$RecipeImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == ingridents
          ? _value.ingridents
          : ingridents // ignore: cast_nullable_to_non_nullable
              as List<String>,
      null == directions
          ? _value.directions
          : directions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as String,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == isVegetarian
          ? _value.isVegetarian
          : isVegetarian // ignore: cast_nullable_to_non_nullable
              as bool?,
      null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      null == difficulty_image
          ? _value.difficulty_image
          : difficulty_image // ignore: cast_nullable_to_non_nullable
              as String,
      null == time_taken
          ? _value.time_taken
          : time_taken // ignore: cast_nullable_to_non_nullable
              as int,
      null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int,
      null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == from_date
          ? _value.from_date
          : from_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      freezed == to_date
          ? _value.to_date
          : to_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeImpl implements _Recipe {
  _$RecipeImpl(
      this.id,
      this.ingridents,
      this.directions,
      this.patient,
      this.name,
      this.imageURL,
      this.difficulty,
      this.isVegetarian,
      this.tag,
      this.difficulty_image,
      this.time_taken,
      this.calories,
      this.video,
      this.from_date,
      this.to_date,
      this.created_at);

  factory _$RecipeImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeImplFromJson(json);

  @override
  int id;
  @override
  List<String> ingridents;
  @override
  List<String> directions;
  @override
  String patient;
  @override
  String name;
  @override
  String imageURL;
  @override
  String difficulty;
  @override
  bool? isVegetarian;
  @override
  List<dynamic> tag;
  @override
  String difficulty_image;
  @override
  int time_taken;
  @override
  int calories;
  @override
  String video;
  @override
  DateTime? from_date;
  @override
  DateTime? to_date;
  @override
  String created_at;

  @override
  String toString() {
    return 'Recipe(id: $id, ingridents: $ingridents, directions: $directions, patient: $patient, name: $name, imageURL: $imageURL, difficulty: $difficulty, isVegetarian: $isVegetarian, tag: $tag, difficulty_image: $difficulty_image, time_taken: $time_taken, calories: $calories, video: $video, from_date: $from_date, to_date: $to_date, created_at: $created_at)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      __$$RecipeImplCopyWithImpl<_$RecipeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeImplToJson(
      this,
    );
  }
}

abstract class _Recipe implements Recipe {
  factory _Recipe(
      int id,
      List<String> ingridents,
      List<String> directions,
      String patient,
      String name,
      String imageURL,
      String difficulty,
      bool? isVegetarian,
      List<dynamic> tag,
      String difficulty_image,
      int time_taken,
      int calories,
      String video,
      DateTime? from_date,
      DateTime? to_date,
      String created_at) = _$RecipeImpl;

  factory _Recipe.fromJson(Map<String, dynamic> json) = _$RecipeImpl.fromJson;

  @override
  int get id;
  set id(int value);
  @override
  List<String> get ingridents;
  set ingridents(List<String> value);
  @override
  List<String> get directions;
  set directions(List<String> value);
  @override
  String get patient;
  set patient(String value);
  @override
  String get name;
  set name(String value);
  @override
  String get imageURL;
  set imageURL(String value);
  @override
  String get difficulty;
  set difficulty(String value);
  @override
  bool? get isVegetarian;
  set isVegetarian(bool? value);
  @override
  List<dynamic> get tag;
  set tag(List<dynamic> value);
  @override
  String get difficulty_image;
  set difficulty_image(String value);
  @override
  int get time_taken;
  set time_taken(int value);
  @override
  int get calories;
  set calories(int value);
  @override
  String get video;
  set video(String value);
  @override
  DateTime? get from_date;
  set from_date(DateTime? value);
  @override
  DateTime? get to_date;
  set to_date(DateTime? value);
  @override
  String get created_at;
  set created_at(String value);
  @override
  @JsonKey(ignore: true)
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

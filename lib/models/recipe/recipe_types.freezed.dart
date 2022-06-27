// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recipe_types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipeTypes _$RecipeTypesFromJson(Map<String, dynamic> json) {
  return _RecipeTypes.fromJson(json);
}

/// @nodoc
class _$RecipeTypesTearOff {
  const _$RecipeTypesTearOff();

  _RecipeTypes call(int id, String type, String image, String type_in_arabic) {
    return _RecipeTypes(
      id,
      type,
      image,
      type_in_arabic,
    );
  }

  RecipeTypes fromJson(Map<String, Object?> json) {
    return RecipeTypes.fromJson(json);
  }
}

/// @nodoc
const $RecipeTypes = _$RecipeTypesTearOff();

/// @nodoc
mixin _$RecipeTypes {
  int get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get type_in_arabic => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeTypesCopyWith<RecipeTypes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeTypesCopyWith<$Res> {
  factory $RecipeTypesCopyWith(
          RecipeTypes value, $Res Function(RecipeTypes) then) =
      _$RecipeTypesCopyWithImpl<$Res>;
  $Res call({int id, String type, String image, String type_in_arabic});
}

/// @nodoc
class _$RecipeTypesCopyWithImpl<$Res> implements $RecipeTypesCopyWith<$Res> {
  _$RecipeTypesCopyWithImpl(this._value, this._then);

  final RecipeTypes _value;
  // ignore: unused_field
  final $Res Function(RecipeTypes) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? image = freezed,
    Object? type_in_arabic = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      type_in_arabic: type_in_arabic == freezed
          ? _value.type_in_arabic
          : type_in_arabic // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$RecipeTypesCopyWith<$Res>
    implements $RecipeTypesCopyWith<$Res> {
  factory _$RecipeTypesCopyWith(
          _RecipeTypes value, $Res Function(_RecipeTypes) then) =
      __$RecipeTypesCopyWithImpl<$Res>;
  @override
  $Res call({int id, String type, String image, String type_in_arabic});
}

/// @nodoc
class __$RecipeTypesCopyWithImpl<$Res> extends _$RecipeTypesCopyWithImpl<$Res>
    implements _$RecipeTypesCopyWith<$Res> {
  __$RecipeTypesCopyWithImpl(
      _RecipeTypes _value, $Res Function(_RecipeTypes) _then)
      : super(_value, (v) => _then(v as _RecipeTypes));

  @override
  _RecipeTypes get _value => super._value as _RecipeTypes;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? image = freezed,
    Object? type_in_arabic = freezed,
  }) {
    return _then(_RecipeTypes(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      type_in_arabic == freezed
          ? _value.type_in_arabic
          : type_in_arabic // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecipeTypes implements _RecipeTypes {
  const _$_RecipeTypes(this.id, this.type, this.image, this.type_in_arabic);

  factory _$_RecipeTypes.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeTypesFromJson(json);

  @override
  final int id;
  @override
  final String type;
  @override
  final String image;
  @override
  final String type_in_arabic;

  @override
  String toString() {
    return 'RecipeTypes(id: $id, type: $type, image: $image, type_in_arabic: $type_in_arabic)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecipeTypes &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality()
                .equals(other.type_in_arabic, type_in_arabic));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(type_in_arabic));

  @JsonKey(ignore: true)
  @override
  _$RecipeTypesCopyWith<_RecipeTypes> get copyWith =>
      __$RecipeTypesCopyWithImpl<_RecipeTypes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeTypesToJson(this);
  }
}

abstract class _RecipeTypes implements RecipeTypes {
  const factory _RecipeTypes(
          int id, String type, String image, String type_in_arabic) =
      _$_RecipeTypes;

  factory _RecipeTypes.fromJson(Map<String, dynamic> json) =
      _$_RecipeTypes.fromJson;

  @override
  int get id;
  @override
  String get type;
  @override
  String get image;
  @override
  String get type_in_arabic;
  @override
  @JsonKey(ignore: true)
  _$RecipeTypesCopyWith<_RecipeTypes> get copyWith =>
      throw _privateConstructorUsedError;
}

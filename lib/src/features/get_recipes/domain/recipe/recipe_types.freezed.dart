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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipeTypes _$RecipeTypesFromJson(Map<String, dynamic> json) {
  return _RecipeTypes.fromJson(json);
}

/// @nodoc
mixin _$RecipeTypes {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get name_in_arabic => throw _privateConstructorUsedError;
  String get imageURL => throw _privateConstructorUsedError;

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
  $Res call({int id, String name, String name_in_arabic, String imageURL});
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
    Object? name = freezed,
    Object? name_in_arabic = freezed,
    Object? imageURL = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      name_in_arabic: name_in_arabic == freezed
          ? _value.name_in_arabic
          : name_in_arabic // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: imageURL == freezed
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_RecipeTypesCopyWith<$Res>
    implements $RecipeTypesCopyWith<$Res> {
  factory _$$_RecipeTypesCopyWith(
          _$_RecipeTypes value, $Res Function(_$_RecipeTypes) then) =
      __$$_RecipeTypesCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, String name_in_arabic, String imageURL});
}

/// @nodoc
class __$$_RecipeTypesCopyWithImpl<$Res> extends _$RecipeTypesCopyWithImpl<$Res>
    implements _$$_RecipeTypesCopyWith<$Res> {
  __$$_RecipeTypesCopyWithImpl(
      _$_RecipeTypes _value, $Res Function(_$_RecipeTypes) _then)
      : super(_value, (v) => _then(v as _$_RecipeTypes));

  @override
  _$_RecipeTypes get _value => super._value as _$_RecipeTypes;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? name_in_arabic = freezed,
    Object? imageURL = freezed,
  }) {
    return _then(_$_RecipeTypes(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      name_in_arabic == freezed
          ? _value.name_in_arabic
          : name_in_arabic // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL == freezed
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecipeTypes implements _RecipeTypes {
  const _$_RecipeTypes(this.id, this.name, this.name_in_arabic, this.imageURL);

  factory _$_RecipeTypes.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeTypesFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String name_in_arabic;
  @override
  final String imageURL;

  @override
  String toString() {
    return 'RecipeTypes(id: $id, name: $name, name_in_arabic: $name_in_arabic, imageURL: $imageURL)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeTypes &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.name_in_arabic, name_in_arabic) &&
            const DeepCollectionEquality().equals(other.imageURL, imageURL));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(name_in_arabic),
      const DeepCollectionEquality().hash(imageURL));

  @JsonKey(ignore: true)
  @override
  _$$_RecipeTypesCopyWith<_$_RecipeTypes> get copyWith =>
      __$$_RecipeTypesCopyWithImpl<_$_RecipeTypes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeTypesToJson(
      this,
    );
  }
}

abstract class _RecipeTypes implements RecipeTypes {
  const factory _RecipeTypes(final int id, final String name,
      final String name_in_arabic, final String imageURL) = _$_RecipeTypes;

  factory _RecipeTypes.fromJson(Map<String, dynamic> json) =
      _$_RecipeTypes.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get name_in_arabic;
  @override
  String get imageURL;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeTypesCopyWith<_$_RecipeTypes> get copyWith =>
      throw _privateConstructorUsedError;
}

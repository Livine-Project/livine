// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favorites.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FavoritesData _$FavoritesDataFromJson(Map<String, dynamic> json) {
  return _FavoritesData.fromJson(json);
}

/// @nodoc
mixin _$FavoritesData {
  List<dynamic> get id => throw _privateConstructorUsedError;
  List<dynamic> get name => throw _privateConstructorUsedError;
  List<dynamic> get name_in_arabic => throw _privateConstructorUsedError;
  List<dynamic> get imageURL => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoritesDataCopyWith<FavoritesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesDataCopyWith<$Res> {
  factory $FavoritesDataCopyWith(
          FavoritesData value, $Res Function(FavoritesData) then) =
      _$FavoritesDataCopyWithImpl<$Res>;
  $Res call(
      {List<dynamic> id,
      List<dynamic> name,
      List<dynamic> name_in_arabic,
      List<dynamic> imageURL});
}

/// @nodoc
class _$FavoritesDataCopyWithImpl<$Res>
    implements $FavoritesDataCopyWith<$Res> {
  _$FavoritesDataCopyWithImpl(this._value, this._then);

  final FavoritesData _value;
  // ignore: unused_field
  final $Res Function(FavoritesData) _then;

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
              as List<dynamic>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      name_in_arabic: name_in_arabic == freezed
          ? _value.name_in_arabic
          : name_in_arabic // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      imageURL: imageURL == freezed
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$$_FavoritesDataCopyWith<$Res>
    implements $FavoritesDataCopyWith<$Res> {
  factory _$$_FavoritesDataCopyWith(
          _$_FavoritesData value, $Res Function(_$_FavoritesData) then) =
      __$$_FavoritesDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<dynamic> id,
      List<dynamic> name,
      List<dynamic> name_in_arabic,
      List<dynamic> imageURL});
}

/// @nodoc
class __$$_FavoritesDataCopyWithImpl<$Res>
    extends _$FavoritesDataCopyWithImpl<$Res>
    implements _$$_FavoritesDataCopyWith<$Res> {
  __$$_FavoritesDataCopyWithImpl(
      _$_FavoritesData _value, $Res Function(_$_FavoritesData) _then)
      : super(_value, (v) => _then(v as _$_FavoritesData));

  @override
  _$_FavoritesData get _value => super._value as _$_FavoritesData;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? name_in_arabic = freezed,
    Object? imageURL = freezed,
  }) {
    return _then(_$_FavoritesData(
      id == freezed
          ? _value._id
          : id // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      name == freezed
          ? _value._name
          : name // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      name_in_arabic == freezed
          ? _value._name_in_arabic
          : name_in_arabic // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      imageURL == freezed
          ? _value._imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FavoritesData implements _FavoritesData {
  const _$_FavoritesData(final List<dynamic> id, final List<dynamic> name,
      final List<dynamic> name_in_arabic, final List<dynamic> imageURL)
      : _id = id,
        _name = name,
        _name_in_arabic = name_in_arabic,
        _imageURL = imageURL;

  factory _$_FavoritesData.fromJson(Map<String, dynamic> json) =>
      _$$_FavoritesDataFromJson(json);

  final List<dynamic> _id;
  @override
  List<dynamic> get id {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_id);
  }

  final List<dynamic> _name;
  @override
  List<dynamic> get name {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_name);
  }

  final List<dynamic> _name_in_arabic;
  @override
  List<dynamic> get name_in_arabic {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_name_in_arabic);
  }

  final List<dynamic> _imageURL;
  @override
  List<dynamic> get imageURL {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageURL);
  }

  @override
  String toString() {
    return 'FavoritesData(id: $id, name: $name, name_in_arabic: $name_in_arabic, imageURL: $imageURL)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoritesData &&
            const DeepCollectionEquality().equals(other._id, _id) &&
            const DeepCollectionEquality().equals(other._name, _name) &&
            const DeepCollectionEquality()
                .equals(other._name_in_arabic, _name_in_arabic) &&
            const DeepCollectionEquality().equals(other._imageURL, _imageURL));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_id),
      const DeepCollectionEquality().hash(_name),
      const DeepCollectionEquality().hash(_name_in_arabic),
      const DeepCollectionEquality().hash(_imageURL));

  @JsonKey(ignore: true)
  @override
  _$$_FavoritesDataCopyWith<_$_FavoritesData> get copyWith =>
      __$$_FavoritesDataCopyWithImpl<_$_FavoritesData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoritesDataToJson(
      this,
    );
  }
}

abstract class _FavoritesData implements FavoritesData {
  const factory _FavoritesData(
      final List<dynamic> id,
      final List<dynamic> name,
      final List<dynamic> name_in_arabic,
      final List<dynamic> imageURL) = _$_FavoritesData;

  factory _FavoritesData.fromJson(Map<String, dynamic> json) =
      _$_FavoritesData.fromJson;

  @override
  List<dynamic> get id;
  @override
  List<dynamic> get name;
  @override
  List<dynamic> get name_in_arabic;
  @override
  List<dynamic> get imageURL;
  @override
  @JsonKey(ignore: true)
  _$$_FavoritesDataCopyWith<_$_FavoritesData> get copyWith =>
      throw _privateConstructorUsedError;
}

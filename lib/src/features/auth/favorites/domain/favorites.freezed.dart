// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$FavoritesDataCopyWithImpl<$Res, FavoritesData>;
  @useResult
  $Res call({List<dynamic> id, List<dynamic> name, List<dynamic> imageURL});
}

/// @nodoc
class _$FavoritesDataCopyWithImpl<$Res, $Val extends FavoritesData>
    implements $FavoritesDataCopyWith<$Res> {
  _$FavoritesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageURL = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      imageURL: null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavoritesDataCopyWith<$Res>
    implements $FavoritesDataCopyWith<$Res> {
  factory _$$_FavoritesDataCopyWith(
          _$_FavoritesData value, $Res Function(_$_FavoritesData) then) =
      __$$_FavoritesDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic> id, List<dynamic> name, List<dynamic> imageURL});
}

/// @nodoc
class __$$_FavoritesDataCopyWithImpl<$Res>
    extends _$FavoritesDataCopyWithImpl<$Res, _$_FavoritesData>
    implements _$$_FavoritesDataCopyWith<$Res> {
  __$$_FavoritesDataCopyWithImpl(
      _$_FavoritesData _value, $Res Function(_$_FavoritesData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageURL = null,
  }) {
    return _then(_$_FavoritesData(
      null == id
          ? _value._id
          : id // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      null == name
          ? _value._name
          : name // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      null == imageURL
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
      final List<dynamic> imageURL)
      : _id = id,
        _name = name,
        _imageURL = imageURL;

  factory _$_FavoritesData.fromJson(Map<String, dynamic> json) =>
      _$$_FavoritesDataFromJson(json);

  final List<dynamic> _id;
  @override
  List<dynamic> get id {
    if (_id is EqualUnmodifiableListView) return _id;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_id);
  }

  final List<dynamic> _name;
  @override
  List<dynamic> get name {
    if (_name is EqualUnmodifiableListView) return _name;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_name);
  }

  final List<dynamic> _imageURL;
  @override
  List<dynamic> get imageURL {
    if (_imageURL is EqualUnmodifiableListView) return _imageURL;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageURL);
  }

  @override
  String toString() {
    return 'FavoritesData(id: $id, name: $name, imageURL: $imageURL)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoritesData &&
            const DeepCollectionEquality().equals(other._id, _id) &&
            const DeepCollectionEquality().equals(other._name, _name) &&
            const DeepCollectionEquality().equals(other._imageURL, _imageURL));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_id),
      const DeepCollectionEquality().hash(_name),
      const DeepCollectionEquality().hash(_imageURL));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
  const factory _FavoritesData(final List<dynamic> id, final List<dynamic> name,
      final List<dynamic> imageURL) = _$_FavoritesData;

  factory _FavoritesData.fromJson(Map<String, dynamic> json) =
      _$_FavoritesData.fromJson;

  @override
  List<dynamic> get id;
  @override
  List<dynamic> get name;
  @override
  List<dynamic> get imageURL;
  @override
  @JsonKey(ignore: true)
  _$$_FavoritesDataCopyWith<_$_FavoritesData> get copyWith =>
      throw _privateConstructorUsedError;
}

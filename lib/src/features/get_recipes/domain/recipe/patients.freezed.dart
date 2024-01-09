// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patients.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Patients _$PatientsFromJson(Map<String, dynamic> json) {
  return _Patients.fromJson(json);
}

/// @nodoc
mixin _$Patients {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String? get json => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientsCopyWith<Patients> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientsCopyWith<$Res> {
  factory $PatientsCopyWith(Patients value, $Res Function(Patients) then) =
      _$PatientsCopyWithImpl<$Res, Patients>;
  @useResult
  $Res call({int id, String name, String image, String? json});
}

/// @nodoc
class _$PatientsCopyWithImpl<$Res, $Val extends Patients>
    implements $PatientsCopyWith<$Res> {
  _$PatientsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
    Object? json = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      json: freezed == json
          ? _value.json
          : json // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientsImplCopyWith<$Res>
    implements $PatientsCopyWith<$Res> {
  factory _$$PatientsImplCopyWith(
          _$PatientsImpl value, $Res Function(_$PatientsImpl) then) =
      __$$PatientsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String image, String? json});
}

/// @nodoc
class __$$PatientsImplCopyWithImpl<$Res>
    extends _$PatientsCopyWithImpl<$Res, _$PatientsImpl>
    implements _$$PatientsImplCopyWith<$Res> {
  __$$PatientsImplCopyWithImpl(
      _$PatientsImpl _value, $Res Function(_$PatientsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
    Object? json = freezed,
  }) {
    return _then(_$PatientsImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == json
          ? _value.json
          : json // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientsImpl implements _Patients {
  const _$PatientsImpl(this.id, this.name, this.image, this.json);

  factory _$PatientsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientsImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String image;
  @override
  final String? json;

  @override
  String toString() {
    return 'Patients(id: $id, name: $name, image: $image, json: $json)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.json, json) || other.json == json));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image, json);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientsImplCopyWith<_$PatientsImpl> get copyWith =>
      __$$PatientsImplCopyWithImpl<_$PatientsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientsImplToJson(
      this,
    );
  }
}

abstract class _Patients implements Patients {
  const factory _Patients(final int id, final String name, final String image,
      final String? json) = _$PatientsImpl;

  factory _Patients.fromJson(Map<String, dynamic> json) =
      _$PatientsImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get image;
  @override
  String? get json;
  @override
  @JsonKey(ignore: true)
  _$$PatientsImplCopyWith<_$PatientsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

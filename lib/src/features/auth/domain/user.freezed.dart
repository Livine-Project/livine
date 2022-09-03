// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return _UserData.fromJson(json);
}

/// @nodoc
mixin _$UserData {
  int? get id => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  int? get patient => throw _privateConstructorUsedError;
  bool? get isVegan => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res>;
  $Res call(
      {int? id, String? username, String? email, int? patient, bool? isVegan});
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res> implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  final UserData _value;
  // ignore: unused_field
  final $Res Function(UserData) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? patient = freezed,
    Object? isVegan = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      patient: patient == freezed
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as int?,
      isVegan: isVegan == freezed
          ? _value.isVegan
          : isVegan // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserDataCopyWith<$Res> implements $UserDataCopyWith<$Res> {
  factory _$$_UserDataCopyWith(
          _$_UserData value, $Res Function(_$_UserData) then) =
      __$$_UserDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id, String? username, String? email, int? patient, bool? isVegan});
}

/// @nodoc
class __$$_UserDataCopyWithImpl<$Res> extends _$UserDataCopyWithImpl<$Res>
    implements _$$_UserDataCopyWith<$Res> {
  __$$_UserDataCopyWithImpl(
      _$_UserData _value, $Res Function(_$_UserData) _then)
      : super(_value, (v) => _then(v as _$_UserData));

  @override
  _$_UserData get _value => super._value as _$_UserData;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? patient = freezed,
    Object? isVegan = freezed,
  }) {
    return _then(_$_UserData(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      patient == freezed
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as int?,
      isVegan == freezed
          ? _value.isVegan
          : isVegan // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserData implements _UserData {
  const _$_UserData(
      this.id, this.username, this.email, this.patient, this.isVegan);

  factory _$_UserData.fromJson(Map<String, dynamic> json) =>
      _$$_UserDataFromJson(json);

  @override
  final int? id;
  @override
  final String? username;
  @override
  final String? email;
  @override
  final int? patient;
  @override
  final bool? isVegan;

  @override
  String toString() {
    return 'UserData(id: $id, username: $username, email: $email, patient: $patient, isVegan: $isVegan)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserData &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.patient, patient) &&
            const DeepCollectionEquality().equals(other.isVegan, isVegan));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(patient),
      const DeepCollectionEquality().hash(isVegan));

  @JsonKey(ignore: true)
  @override
  _$$_UserDataCopyWith<_$_UserData> get copyWith =>
      __$$_UserDataCopyWithImpl<_$_UserData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDataToJson(
      this,
    );
  }
}

abstract class _UserData implements UserData {
  const factory _UserData(
      final int? id,
      final String? username,
      final String? email,
      final int? patient,
      final bool? isVegan) = _$_UserData;

  factory _UserData.fromJson(Map<String, dynamic> json) = _$_UserData.fromJson;

  @override
  int? get id;
  @override
  String? get username;
  @override
  String? get email;
  @override
  int? get patient;
  @override
  bool? get isVegan;
  @override
  @JsonKey(ignore: true)
  _$$_UserDataCopyWith<_$_UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

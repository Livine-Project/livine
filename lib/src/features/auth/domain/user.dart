import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserData with _$UserData {
  const factory UserData(int? id, String? username, String? email, int? patient,
      bool? isVegan) = _UserData;
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

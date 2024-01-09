// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'patients.freezed.dart';
part 'patients.g.dart';

@freezed
class Patients with _$Patients {
  const factory Patients(
    int id,
    String name,
    String image,
    String? json
  ) = _Patients;
  factory Patients.fromJson(Map<String, dynamic> json) =>
      _$PatientsFromJson(json);
}

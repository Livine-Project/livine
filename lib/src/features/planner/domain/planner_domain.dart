
import 'package:freezed_annotation/freezed_annotation.dart';

part 'planner_domain.freezed.dart';
part 'planner_domain.g.dart';

@freezed
class Meal with _$Meal {
  const factory Meal(
    int id,
    String name,
    DateTime? from_date,
    DateTime? to_date,
    // Color? background,
    // Color? foreground,
  ) = _Meal;
  factory Meal.fromJson(Map<String, dynamic> json) =>
      _$MealFromJson(json);
}
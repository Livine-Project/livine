import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livine/src/features/planner/data/planner_data.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../domain/planner_domain.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Planner extends StatelessWidget {
  const Planner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Consumer(builder: (context, ref, child) {
        final meals = ref.watch(getMealsProvider);
        return meals.when(
            data: (meals) {
              return SfCalendar(
                key: UniqueKey(),
                view: CalendarView.day,
                maxDate: DateTime.now().add(Duration(days: 2)),
                dataSource: MealDataSource(_getDataSource(meals)),
                appointmentBuilder: appointmentBuilder,
                blackoutDates: [
                  DateTime.now().add(Duration(days: 1)),
                  DateTime.now().add(Duration(days: 2)),
                ],
                onTap: (details) {
                  if (details.appointments == null) return;
                  final int recipeID = details.appointments?.first.id;
                  context.push('/recipe/details', extra: recipeID);
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text(error.toString())));
      })),
    );
  }

  List<Meal> _getDataSource(Map<String, Meal> source) {
    final currentTime = DateTime.now();
    final List<Meal> meals = [];

    Meal _createMeal(String mealType, int hours) {
      final meal = source[mealType]!;
      final mealTime = DateTime(
        currentTime.year,
        currentTime.month,
        currentTime.day,
        hours,
      );
      final mealEndTime = mealTime.add(Duration(hours: 3));

      return Meal(meal.id, meal.name, mealTime, mealEndTime);
    }

    meals.add(_createMeal("breakfast", 6));
    meals.add(_createMeal("lunch", 12));
    meals.add(_createMeal("dinner", 18));

    return meals;
  }

  Widget appointmentBuilder(
      BuildContext context, CalendarAppointmentDetails details) {
    final Meal event = details.appointments.first;
    return Container(
      width: details.bounds.width,
      height: details.bounds.height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${event.from_date?.hour}:${event.from_date?.minute} - ${event.to_date?.hour}:${event.to_date?.minute}',
              style: TextStyle(
                  fontSize: 13,
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimaryContainer
                      .withOpacity(0.5)),
            ),
            AutoSizeText(
              event.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              presetFontSizes: [20, 17, 16],
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            // Text(
            //   event.name,
            //   maxLines: 2,
            //   overflow: TextOverflow.ellipsis,
            //   style: TextStyle(
            //       fontSize: 20,
            //       color: Theme.of(context).colorScheme.onPrimaryContainer),
            // ),
          ],
        ),
      ),
    );
  }
}

class MealDataSource extends CalendarDataSource {
  MealDataSource(List<Meal> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from_date;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to_date;
  }

  @override
  String getSubject(int index) {
    return appointments![index].name;
  }
}

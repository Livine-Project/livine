import 'package:flutter/material.dart';

import '../../features/planner/presentation/planner.dart';
import '../../features/settings/presentation/settings.dart';
import '../../features/get_recipes/presentation/home.dart';
import '../../features/auth/profiles/presentation/profile.dart';
import '../../features/meals/presentation/categories.dart';

final List<Widget> children = [
  const Home(),
  const Planner(),
  const Profile(),
];

final List<Widget> tabletChildren = [
  const Home(),
  const Patient(),
  const Profile(),
  const SettingsWidget()
];

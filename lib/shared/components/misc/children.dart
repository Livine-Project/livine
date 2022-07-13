import 'package:flutter/material.dart';

import '../../../modules/Settings/settings.dart';
import '../../../modules/home/home.dart';
import '../../../modules/profile/profile.dart';
import '../../../modules/meals/categories.dart';
import '../../../modules/trackers/water/water_reminder.dart';

final List<Widget> children = [
  const Home(),
  const Patient(),
  const Hydration(),
  const Profile(),
];

final List<Widget> tabletChildren = [
  const Home(),
  const Patient(),
  const Hydration(),
  const Profile(),
  const SettingsWidget()
];

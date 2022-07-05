 import 'package:flutter/material.dart';

import '../../../modules/Settings/settings.dart';
import '../../../modules/categories/meals.dart';
import '../../../modules/home/home.dart';
import '../../../modules/profile/profile.dart';

final List<Widget> children = [
    Home(),
    Patient(),
    Profile(),
  ];

final List<Widget> tabletChildren = [
    Home(),
    Patient(),
    Profile(),
    SettingsWidget()
  ];


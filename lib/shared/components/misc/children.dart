 import 'package:flutter/material.dart';

import '../../../modules/Settings/settings.dart';
import '../../../modules/categories/categories.dart';
import '../../../modules/home.dart';
import '../../../modules/profile/profile.dart';

final List<Widget> children = [
    Home(),
    Patient(),
    // Pristine(),
    Profile(),
  ];

final List<Widget> tabletChildren = [
    Home(),
    Patient(),
    // Pristine(),
    Profile(),
    SettingsWidget()
  ];


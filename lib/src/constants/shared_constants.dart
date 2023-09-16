import 'package:flutter/material.dart';

import '../shared/cache/cache_helper.dart';

int patientID = CacheHelper.getInt("patientID") ?? 0;

bool username = CacheHelper.getBool("username") ?? false;


bool isGuest = CacheHelper.getBool("isGuest") ?? false;

bool isBoarded = CacheHelper.getBool("isBoarded") ?? false;

Object themeColor = CacheHelper.getString("themeColor") ?? Colors.green;

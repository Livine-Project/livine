import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livine/src/shared/cache/cache_helper.dart';

final navigationNotifierProvider =
    StateNotifierProvider((ref) => NavigationNotifier());

class NavigationNotifier extends StateNotifier<ScrollPhysics?> {
  NavigationNotifier() : super(_initialScrollPhysics());

  static ScrollPhysics? _initialScrollPhysics() {
    bool isSwipeNavigation = CacheHelper.getBool("isSwipeNavigation") ?? false;
    return isSwipeNavigation ? null : const NeverScrollableScrollPhysics();
  }

  void togglePhysics(bool value) async {
    state = value == false ? const NeverScrollableScrollPhysics() : null;
    await CacheHelper.setBool("isSwipeNavigation",
        state == NeverScrollableScrollPhysics() ? false : true);
  }
}

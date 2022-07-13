import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rive/rive.dart';

import '../../../modules/trackers/water/glass_water.dart';
import '../cache/cache_helper.dart';

class HydrationControl {
  SMINumber? _level;

  final totalAmount = 2000;

  int currentAmount = CacheHelper.getInt("currentWaterAmount") ?? 0;
  double ratePercentage =
      CacheHelper.getInt("percentageWaterRate")?.toDouble() ?? 0;

  int remainingAmount = CacheHelper.getInt("remainingWaterAmount") ?? 0;

  double waterLevelOnLocale = CacheHelper.getInt("WaterLevel")?.toDouble() ?? 0;

  int increaseAmount = CacheHelper.getInt("increaseAmount") ?? 200;

  int getAmountfromState(ref) {
    return ref.read(amountProvider.notifier).state;
  }

  NumberFormat formatter = NumberFormat('#,##,000');

  late RiveAnimationController animationController;

  void onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'Wave Animation');

    artboard.addController(controller!);
    _level = controller.findInput<double>("level") as SMINumber;
  }

  void animateOnLevel(void Function(void Function()) setState) {
    setState(() {
      _level?.value += 1;
    });
  }

  void saveDataWithSharedPref() {
    CacheHelper.setInt("currentWaterAmount", currentAmount);
    CacheHelper.setInt("remainingWaterAmount", remainingAmount);
    CacheHelper.setInt("percentageWaterRate", ratePercentage.toInt());
    CacheHelper.setInt("WaterLevel", _level?.value.toInt() ?? 0);
  }

  void resetData(void Function(void Function()) setState) {
    CacheHelper.remove("currentWaterAmount");
    CacheHelper.remove("remainingWaterAmount");
    CacheHelper.remove("percentageWaterRate");
    CacheHelper.remove("WaterLevel");

    setState(() {
      currentAmount = 0;
      ratePercentage = 0;
      remainingAmount = totalAmount;
    });
  }

  void resetonFull(void Function(void Function()) setState) {
    if (currentAmount == totalAmount) {
      setState(() {
        ratePercentage = 100;

      });
    } else if (currentAmount > totalAmount) {
      resetData(setState);
    }

  }

  void togglePlay(WidgetRef ref, void Function(void Function()) setState) {
    currentAmount +=
        getAmountfromState(ref) == 0 ? increaseAmount : getAmountfromState(ref);
    remainingAmount = totalAmount - currentAmount;
    ratePercentage = (currentAmount / totalAmount) * 100;
    saveDataWithSharedPref();
    animateOnLevel(setState);
    resetonFull(setState);
  }
}

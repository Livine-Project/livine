// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:livine/shared/constants/constants.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';

class Hydration extends ConsumerStatefulWidget {
  const Hydration({Key? key}) : super(key: key);

  @override
  ConsumerState<Hydration> createState() => _HydrationState();
}

class _HydrationState extends ConsumerState<Hydration> {
  @override
  void initState() {
    hydrationControl.remainingAmount =
        hydrationControl.totalAmount - hydrationControl.currentAmount;
    hydrationControl.animationController = SimpleAnimation(
        'rise ${hydrationControl.waterLevelOnLocale.toInt() + 1}',
        autoplay: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          RiveAnimation.asset(
            'assets/images/rive/water.riv',
            fit: BoxFit.cover,
            onInit: hydrationControl.onRiveInit,
            controllers: [hydrationControl.animationController],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    hydrationControl.currentAmount == 0
                        ? "0 ml"
                        : "${hydrationControl.formatter.format(hydrationControl.currentAmount)} ml",
                    style: TextStyle(
                        fontFamily: 'Kine',
                        fontSize: 50.0,
                        color: theme.tertiary),
                  ),
                  Text(
                    "Remaining: ${hydrationControl.remainingAmount} ml",
                    style: TextStyle(
                        fontFamily: 'Kine',
                        fontSize: 15.0,
                        color: theme.tertiary),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${hydrationControl.ratePercentage.round()} %",
                    style: TextStyle(
                        fontFamily: 'Kine',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: theme.tertiary),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.network(
                    "https://assets4.lottiefiles.com/packages/lf20_6UE5Th.json",
                    height: 120,
                  ),
                  ElevatedButton(
                    onPressed: () => hydrationControl.togglePlay(ref, setState),
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(30),
                        alignment: Alignment.bottomCenter,
                        elevation: 30),
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: theme.tertiary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/glass_water', extra: {
          "current": hydrationControl.currentAmount,
          "remains": hydrationControl.remainingAmount,
          "rate": hydrationControl.ratePercentage,
        }),
        child: const Icon(
          FontAwesomeIcons.glassWater,
        ),
      ),
    );
  }
}

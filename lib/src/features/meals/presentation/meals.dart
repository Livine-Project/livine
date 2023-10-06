import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common_widgets/no_connection.dart';
import '../../../common_widgets/recipe/food_category_widget.dart';
import '../../../constants/constants.dart';
import '../../../shared/connectivity/check_network.dart';
import '../../../translations/domain/translation_provider.dart';

class Patient extends ConsumerStatefulWidget {
  const Patient({Key? key}) : super(key: key);

  @override
  ConsumerState<Patient> createState() => _PatientState();
}

class _PatientState extends ConsumerState<Patient> {
  @override
  Widget build(BuildContext context) {
    ConnectivityStatus network = ref.watch(checkNetworkProvider);
    final word = TranslationRepo.translate(context);
    return network == ConnectivityStatus.On
        ? Scaffold(
            body: RawScrollbar(
              thumbColor: colorScheme(context).tertiary,
              thickness: 5,
              radius: const Radius.circular(10),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GridView.count(
                  crossAxisCount: rh.responsiveCatogeries(context),
                  childAspectRatio: 3 / 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    FoodCategory(
                      navigate: '/breakfast',
                      name: word?.breakfast ?? '',
                      image:
                          "https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=710&q=80",
                    ),
                    FoodCategory(
                      navigate: '/lunch',
                      name: word?.lunch ?? '',
                      image:
                          "https://images.unsplash.com/photo-1576866209830-589e1bfbaa4d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                    ),
                    FoodCategory(
                      navigate: '/dinner',
                      name: word?.dinner ?? '',
                      image:
                          "https://images.unsplash.com/photo-1473973916745-60839aebf06b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                    ),
                    FoodCategory(
                      navigate: '/snacks',
                      name: word?.snacks ?? '',
                      image:
                          "https://images.unsplash.com/photo-1496412705862-e0088f16f791?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                    ),
                  ],
                ),
              ),
            ),
          )
        : NoConnection();
  }
}

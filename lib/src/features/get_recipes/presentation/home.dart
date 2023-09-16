// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables, type_annotate_public_apis, dead_code

import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livine/src/shared/connectivity/check_network.dart';
import '../../../common_widgets/no_connection.dart';
import '../../../common_widgets/recipe/recipe_grid_view.dart';

import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../shared/notifications/health_notification.dart';
import '../../../translations/domain/translation_provider.dart';
import '../data/get_user_name.dart';
import 'search/search_delegate.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();
    onlyAndroid();
  }

  onlyAndroid() async {
    if (Platform.isAndroid) {
      showNotification();
    }
  }

  @override
  Widget build(BuildContext context) {
    ConnectivityStatus network = ref.watch(checkNetworkProvider);
    String name = ref.watch(userNameProvider).valueOrNull ?? '';
    final word = TranslationRepo.translate(context);

    return network == ConnectivityStatus.On
        ? Scaffold(
            body: SafeArea(
              child: RawScrollbar(
                thumbColor: colorScheme(context).tertiary,
                thickness: 5,
                radius: const Radius.circular(10),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: "${word?.welcome}\n",
                                      style: TextStyle(
                                          fontSize: 35.0,
                                        
                                          color:
                                              colorScheme(context).onSurface)),
                                  TextSpan(
                                      text: name,
                                      style: TextStyle(
                                        fontSize: 35.0,
                                        fontFamily: 'Kine',
                                        color: colorScheme(context).onSurface,
                                        overflow: TextOverflow.ellipsis,
                                      ))
                                ])),
                                IconButton(
                                    onPressed: () {
                                      showSearch(
                                          context: context,
                                          delegate: CustomSearchDelegate());
                                    },
                                    icon: Icon(Icons.search))
                              ],
                            )),
                        const SizedBox(height: 20.0),
                        RecipesGridView(),
                      ]),
                ),
              ),
            ),
            // floatingActionButton: Visibility(
            //   visible: Platform.isAndroid == true,
            //   child: FloatingActionButton(
            //     heroTag: "btn1",
            //     onPressed: () => context.push("/scan"),
            //     child: Image.asset(
            //       'assets/images/icons/scan.png',
            //       width: 40,
            //       color: getColorScheme(context).onPrimaryContainer,
            //     ),
            //   ),
            // ),
          )
        : NoConnection();
  }
}

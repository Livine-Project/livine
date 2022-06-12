import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../models/user/user.dart';
import '../../shared/styles/colors.dart';
import '../../translations/locale_keys.g.dart';


class ChooseContent extends StatefulWidget {
  const ChooseContent({Key? key}) : super(key: key);

  @override
  State<ChooseContent> createState() => _ChooseContentState();
}

class _ChooseContentState extends State<ChooseContent> {
  Color bg1 = Colors.white;

  Color bg2 = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: Consumer(
            builder: (context, ref, child) {
              
                  return InkWell(
                    splashColor: primaryColor,
                    onTap: () async {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString("UserType", "General");
                      ref.watch(userTypeProvider.notifier).state = "General";

                      setState(() {
                        bg2 = Colors.black;
                        bg1 = primaryColor;
                      });
                      context.go('/navigate');
                    },
                    child: Ink(
                      width: 100,
                      color: bg1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.tag_faces_outlined,
                            size: 150.0,
                            color: Theme.of(context).brightness ==
                                    Brightness.dark
                                ? Colors.black
                                : Colors.black,
                          ),
                          Center(
                            child: Text(
                              LocaleKeys.healthy.tr(),
                              style: TextStyle(
                                fontFamily: 'Kine',
                                fontSize: 20.0,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.black
                                    : Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              
            
          )),
          Expanded(child: Consumer(
            builder: (context, ref, child) {
              return InkWell(
                splashColor: thirdColor,
                onTap: () async {
                  setState(() {
                    bg2 = thirdColor;
                    bg1 = Colors.white;
                  });
                  context.pushNamed("Content_Patient");
                },
                child: Ink(
                  width: 100,
                  color: bg2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.disease,
                        size: 150.0,
                        color: Colors.white,
                      ),
                      Center(
                        child: Text(
                          LocaleKeys.patient.tr(),
                          style: TextStyle(
                              fontFamily: 'Kine',
                              fontSize: 20.0,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}

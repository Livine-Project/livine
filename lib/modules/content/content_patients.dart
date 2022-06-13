import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../models/user/user.dart';
import '../../shared/styles/colors.dart';
import '../../shared/components/misc/loading.dart';
import '../../models/recipe/recipe_types.dart';
import '../../translations/locale_keys.g.dart';

class ContentPatient extends StatefulWidget {
  const ContentPatient({Key? key}) : super(key: key);

  @override
  State<ContentPatient> createState() => _ContentPatientState();
}

int _value = 0;

class _ContentPatientState extends State<ContentPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          
          title: Text(
            LocaleKeys.Iam_a.tr(),
            style: TextStyle( fontFamily: 'Kine'),
            
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          
        ),
        body: Consumer(
          builder: ((context, ref, child) {
            final recipesData = ref.watch(patientTypesProvider);
            return recipesData.when(
                data: (data) {
                  return Wrap(
                    spacing: 8,
                    children: List.generate(data.length, (index) {
                      return ChoiceChip(
                        backgroundColor: Colors.black,
                        labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        elevation: 1,
                        selectedColor: thirdColor,
                        label: Text(
                          context.locale.languageCode == "en"
                              ? data[index].type + " Patient"
                              : "مريض ${data[index].type_in_arabic} ",
                          style: TextStyle(
                              fontFamily: 'Kine',
                              fontSize: 16.0,
                              color: Colors.white),
                        ),
                        selected: _value == index,
                        onSelected: (value) async {
                          setState(() {
                            _value = value ? index : _value;
                          });
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString("UserType", data[index].type);
                          ref.watch(userTypeProvider.state).state =
                              data[index].type;
                          context.go('/navigate');
                        },
                      );
                    }).toList(),
                  );
                },
                error: (e, s) {
                  print('$e\n$s');
                  return kDebugMode ? Text(e.toString()) : Loading();
                },
                loading: () => Loading());
          }),
        ));
  }
}

class PatientMenu extends StatefulWidget {
  final String name;
  const PatientMenu({Key? key, required this.name}) : super(key: key);

  @override
  State<PatientMenu> createState() => _PatientMenuState();
}

class _PatientMenuState extends State<PatientMenu> {
  Color bg1 = Colors.black;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          bg1 = thirdColor;
        });
      },
      child: Ink(
        width: 120,
        height: 40,
        decoration: BoxDecoration(
            color: bg1, borderRadius: BorderRadius.circular(50.0)),
        child: Center(
          child: Text(
            widget.name,
            style: TextStyle(
                fontSize: 18.0, color: Colors.white, fontFamily: 'Kine'),
          ),
        ),
      ),
    );
  }
}

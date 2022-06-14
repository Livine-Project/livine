import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../../translations/locale_keys.g.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  Client client = http.Client();
  final _username = TextEditingController();

  final _email = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // void updateToDjango() async {
  //   // ignore: unnecessary_null_comparison
  //   final url =
  //       'https://livine.pythonanywhere.com/api/user/update/${widget.id}';
  //   final response = await client.post(
  //     Uri.parse(url),
  //     body: {
  //       'id': testID,
  //       'username': _username.text,
  //       'email': _email.text,
  //     },
  //   );
  //   if (response.statusCode == 200) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text("Profile has been updated"),
  //     ));
  //     GoRouter.of(context).go('/');
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text("Error occured"),
  //     ));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Profile")),
      body: Column(children: [
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    maxLength: 20,
                    validator: (u) {
                      if (u!.isEmpty) {
                        return "Please enter your username";
                      } else if (u.length >= 20) {
                        return "Username shouldn't be more than 20 characters";
                      }
                      return null;
                    },
                    controller: _username,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      labelText: LocaleKeys.username.tr(),
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return context.locale.languageCode == "en"
                          ? "Please enter your email"
                          : "من فضلك ادخل البريد الاكتروني";
                    }

                    return null;
                  },
                  controller: _email,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    labelText: context.locale.languageCode == "en"
                        ? 'Email'
                        : "البريد الاكتروني",
                    labelStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        heroTag: 'btn3',
        onPressed: () {},
        child: Icon(Icons.save),
      ),
    );
  }
}

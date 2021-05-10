import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Others/loading.dart';
import '../main.dart';

class Register_Desktop extends StatefulWidget {
  @override
  _Register_DesktopState createState() => _Register_DesktopState();
}

class _Register_DesktopState extends State<Register_Desktop> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _passowrd = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: Image(
                  image: AssetImage('./images/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(child: Register_Text()),
            ],
          ));
  }
}

class Register_Text extends StatefulWidget {
  @override
  _Register_TextState createState() => _Register_TextState();
}

class _Register_TextState extends State<Register_Text> {
  TextEditingController _name = TextEditingController();

  TextEditingController _email = TextEditingController();

  TextEditingController _passowrd = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(
          children: [
            Column(
              children: [
                WindowTitleBarBox(
                  child: Row(
                    children: [Expanded(child: MoveWindow()), WindowButtons()],
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                child: Text('Signup',
                    style:
                        TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        Form(
          key: _formKey,
          child: Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _name,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Enter your name";
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'NAME ',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue))),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: _email,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Enter your email";
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue))),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: _passowrd,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Enter your password";
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'PASSWORD ',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue))),
                    obscureText: true,
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    height: 40.0,
                    child: GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState.validate()) {
                          try {
                            var result = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: _email.text,
                                    password: _passowrd.text);
                            if (result != null) {
                              setState(() {
                                loading = true;
                              });
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc()
                                  .set({
                                'name': _name.text,
                                'email': _email.text,
                              });
                              Navigator.pushNamed(context, '/login');
                            } else {
                              setState(() {
                                loading = false;
                              });
                            }
                          } on PlatformException catch (error) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text(error.message.toString())));
                          }
                        }
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.blue,
                        color: Colors.blueAccent,
                        elevation: 7.0,
                        child: Builder(
                          builder: (context) => Center(
                            child: Text(
                              'SIGNUP',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Center(
                          child: Text('Go Back',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
        SizedBox(height: 15.0),
      ],
    );
  }
}

var buttonColors = WindowButtonColors(
    iconNormal: Color(0xFF805306),
    mouseOver: Colors.blueAccent,
    mouseDown: Color(0xFF805306),
    iconMouseOver: Color(0xFF805306),
    iconMouseDown: Color(0xFFFFD500));

var closeButtonColors = WindowButtonColors(
    mouseOver: Color(0xFFD32F2F),
    mouseDown: Color(0xFFB71C1C),
    iconNormal: Color(0xFF805306),
    iconMouseOver: Colors.white);

class WindowButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}

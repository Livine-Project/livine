import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Others/loading.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _email = TextEditingController();

  TextEditingController _passowrd = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text('Hello',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                    child: Text('There',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                    child: Text('.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                  )
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
                        controller: _email,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter your email';
                          }
                        },
                        decoration: InputDecoration(

                            labelText: 'EMAIL',

                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue))),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Enter your password";

                          }
                        },
                        controller: _passowrd,
                        decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue))),
                        obscureText: true,
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        alignment: Alignment(1.0, 0.0),
                        padding: EdgeInsets.only(top: 15.0, left: 20.0),
                        child: InkWell(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/reset_password');
                            },
                              child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.blue,
                          color: Colors.blueAccent,
                          elevation: 7.0,
                          child: Builder(
                            builder: (context) => GestureDetector(
                              onTap: () async{
                                if (_formKey.currentState.validate())  {
                                  try {

                                    var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text, password: _passowrd.text);
                                    if (result != null) {
                                      setState(() {
                                        loading = true;
                                      });
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                      prefs.setString('email', result.user.email);
                                      Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (BuildContext ctx) => OnBoarding()));
                                    }else{
                                      setState(() {
                                        loading = false;
                                      });
                                    }
                                  }on PlatformException catch (e) {
                                    Scaffold.of(context).showSnackBar(SnackBar(content: Text(e.message.toString())));
                                  }
                                }

                              },
                              child: Center(
                                child: Text(
                                  'LOGIN',
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
                  //     SizedBox(height: 20.0),
                  //     Container(
                  //       height: 40.0,
                  //       color: Colors.transparent,
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //             border: Border.all(
                  //                 color: Colors.black,
                  //                 style: BorderStyle.solid,
                  //                 width: 1.0),
                  //             color: Colors.transparent,
                  //             borderRadius: BorderRadius.circular(20.0)),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: <Widget>[
                  //             // Center(
                  //             //   child:
                  //             //       ImageIcon(AssetImage('assets/facebook.png')),
                  //             // ),
                  //             // SizedBox(width: 10.0),
                  //             // Center(
                  //             //   child: Text('Log in with facebook',
                  //             //       style: TextStyle(
                  //             //           fontWeight: FontWeight.bold,
                  //             //           fontFamily: 'Montserrat')),
                  //             // )
                  //           ],
                  //         ),
                  //       ),
                  //     )
                     ],
                   ),
                   ),
            ),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'New to Guava ?',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/register');
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
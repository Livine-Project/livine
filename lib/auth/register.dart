import 'package:app/Misc/Terms.dart';
import 'package:app/Others/loading.dart';
import 'package:app/desktop/register_desktop.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 400) {
          return Register_Standard();
        } else {
          return Register_Desktop();
        }
      },
    );
  }
}

class Register_Standard extends StatefulWidget {
  @override
  _Register_StandardState createState() => _Register_StandardState();
}

class _Register_StandardState extends State<Register_Standard> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _passowrd = TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override


  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                          child: Text(
                            'Signup',
                            style: TextStyle(
                                fontSize: 80.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                          child: Text(
                            '.',
                            style: TextStyle(
                                fontSize: 80.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                        padding:
                            EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
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
                                      borderSide:
                                          BorderSide(color: Colors.blue))),
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
                                      borderSide:
                                          BorderSide(color: Colors.blue))),
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
                                      borderSide:
                                          BorderSide(color: Colors.blue))),
                              obscureText: true,
                            ),
                            SizedBox(height: 25.0),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 20.0),
                                  child: Text(
                                    "By creating an account , you agree on our ",
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext ctx) =>
                                              Terms())),
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 20.0),
                                    child: Text(
                                      "Terms and Conditions",
                                      style:
                                          TextStyle(color: Colors.blueAccent),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.0),
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
                                        users.doc(result.user.uid)
                                        .set({
                                        "name" : _name.text,
                                        "email" : _email.text,
                                        "verified": result.user.emailVerified,
                                      });
                                            
                                        Navigator.pushNamed(context, '/verify');
                                      } else {
                                        setState(() {
                                          loading = false;
                                        });
                                      }
                                    } on PlatformException catch (error) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  error.message.toString())));
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
                ],
              ),
            ),
          );
  }
}

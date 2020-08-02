import 'package:app/Others/loading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _passowrd = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool loading = false;


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() :  Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'Signup',
                    style:
                        TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
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
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.blue,
                          color: Colors.blueAccent,
                          elevation: 7.0,
                          child: Builder(
                              builder: (context) => GestureDetector(
                              onTap: () async{
                                if (_formKey.currentState.validate()) {
                                  try {
                                    var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email.text, password: _passowrd.text);
                                    if (result != null ) {
                                      setState(() {
                                        loading = true;
                                      });
                                    Firestore.instance.collection('users').document().setData({
                                    'name' : _name.text,
                                    'email': _email.text,
                                    });
                                    Navigator.pushNamed(context, '/login');
                                  } else{
                                      setState(() {
                                        loading = false;
                                      });
                                    }
                                  }on PlatformException catch (error) {
                                    Scaffold.of(context).showSnackBar(SnackBar(content: Text(error.message.toString())));

                                  }            

                                }
                              },
                              child: Center(
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
                          child: 
                          
                              Center(
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
        );
  }
}
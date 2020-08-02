import 'package:app/Others/loading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class Reset_Password extends StatefulWidget {
  @override
  _Reset_PasswordState createState() => _Reset_PasswordState();
}

class _Reset_PasswordState extends State<Reset_Password> {

  TextEditingController _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password"),
        backgroundColor: Colors.blue[900],
        automaticallyImplyLeading: false,
        centerTitle: true,
        
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Form(
            key: _formKey,
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return "Enter your email";
                }
              },
              controller: _email,
              decoration: InputDecoration(
                
                  labelText: 'EMAIL',
            
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
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
                                    await FirebaseAuth.instance.sendPasswordResetEmail(email: _email.text);
                                  } on PlatformException catch (e) {
                                    Scaffold.of(context).showSnackBar(SnackBar(content: Text(e.message.toString())));
                                  }
                                  
                                  
                                  // var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text, password: _passowrd.text);
                                  // if (result != null) {
                                  //   Navigator.pushNamed(context, '/onboarding');
                                  // }
                                }
                              },
                              child: Center(
                                child: Text(
                                  'Reset Password',
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
      ),
        
    );
  }
}
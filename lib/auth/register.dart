import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Client client = http.Client();
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  registertoDjango() async {
    final url = 'https://livine.pythonanywhere.com/api/register/';
    await client.post(Uri.parse(url), body: {
      'username': '${_username.text}',
      'email': '${_email.text}',
      'password': '${_password.text}',
    });

    Navigator.pushNamed(context, '/login');
  }

  validateForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      registertoDjango();
    } else {
      debugPrint('form is invalid');
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/login/register-min.jpg'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              'images/login/back_arrow.svg',
              width: 25.0,
              color: Color(0xfff3F37C9),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
          ),
          child: Padding(
            padding: EdgeInsets.all(23),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            maxLength: 20,
                            validator: (u) {
                              if (u.isEmpty) {
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
                                    borderSide:
                                        BorderSide(color: Color(0xfff3F37C9))),
                                labelText: 'Username',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Color(0xfff3F37C9))),
                          ),
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          validator: (e) {
                            if (e.isEmpty) {
                              return "Please enter your email";
                            }
                            return null;
                          },
                          controller: _email,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xfff3F37C9))),
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                  fontSize: 15, color: Color(0xfff3F37C9))),
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.go,
                          validator: (p) {
                            if (p.length < 6 && p.isNotEmpty) {
                              return "Password needs to be atleast 6 characters ";
                            } else if (p.isEmpty) {
                              return "Please enter your password ";
                            }
                            return null;
                          },
                          controller: _password,
                          obscureText: true,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xfff3F37C9))),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  fontSize: 15, color: Color(0xfff3F37C9))),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: MaterialButton(
                    onPressed: validateForm,
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    color: Color(0xfff3F37C9),
                    elevation: 0,
                    minWidth: 350,
                    height: 60,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?"),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/login'),
                          child: Text(
                            'Sign In'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Color(0xfff3F37C9),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

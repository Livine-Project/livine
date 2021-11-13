// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/responsive/orientation_layout.dart';
import 'package:app/responsive/screen_type_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Patient extends StatefulWidget {
  @override
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  @override
  Widget build(BuildContext context) {
    // final theme = Provider.of<AppTheme>(context);
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: NormalCallory(),
      ),
    );
  }
}

class NormalCallory extends StatelessWidget {
  const NormalCallory({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[900]
          : Color(0xfff4895EF),
      body: SafeArea(
        child: Column(children: [
          Flexible(
            child: GridView.count(
              padding: const EdgeInsets.all(30),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[900]
          : Color(0xfff3F37C9),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 0,
                          blurRadius: 20,
                          offset: Offset(0, 5),
                        )
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt_rounded,
                            size: 50.0,
                            color: Colors.white,
                          ),
                          Text(
                            "Scan",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/breakfast'),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage(
                              'images/calories/breakfast.png',
                            ),
                            width: 100.0,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "BreakFast",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: 
                      Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[900]
          : Color(0xfff4361EE),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 0,
                          blurRadius: 20,
                          offset: Offset(0, 5),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/lunch'),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage(
                              'images/calories/lunch.png',
                            ),
                            width: 100.0,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Lunch",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[900]
          : Color(0xfff4CC9f0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 0,
                          blurRadius: 20,
                          offset: Offset(0, 5),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/dinner'),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(
                            'images/calories/dinner.png',
                          ),
                          width: 100.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Dinner",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[900]
          : Color(0xfff3F37C9),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 0,
                          blurRadius: 20,
                          offset: Offset(0, 5),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/snacks'),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage(
                              'images/calories/yogurt.png',
                            ),
                            width: 100.0,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Snacks",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[900]
          : Color(0xfff3F37C9),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 0,
                          blurRadius: 20,
                          offset: Offset(0, 5),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

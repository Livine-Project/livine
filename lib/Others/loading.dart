import 'package:app/auth/login.dart';
import 'package:app/intro/base.dart';
import 'package:app/main.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: SpinKitPumpingHeart(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}

class NoConnectionWidget extends StatefulWidget {
  const NoConnectionWidget({ Key key }) : super(key: key);

  @override
  State<NoConnectionWidget> createState() => _NoConnectionWidgetState();
}

class _NoConnectionWidgetState extends State<NoConnectionWidget> {


  @override
  void initState() {

    super.initState();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
      if (username == true) {
           Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (BuildContext ctx) => Navigation()));
      } else{
      Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (BuildContext ctx) => Login()));
      }
      
    }
  });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitPumpingHeart(
                  color: Colors.blueAccent,
                  size: 50.0,
                  
                ),
                Text("No Internet connection , \n please check your wifi or data"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
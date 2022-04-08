import '../auth/login.dart';
import '../intro/base.dart';
import '../main.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitPumpingHeart(
        color: Color(0xfff80ed99),
      ),
    );
  }
}

class NoConnectionWidget extends StatefulWidget {
  const NoConnectionWidget({Key? key}) : super(key: key);

  @override
  State<NoConnectionWidget> createState() => _NoConnectionWidgetState();
}

class _NoConnectionWidgetState extends State<NoConnectionWidget> {
  @override
  void initState() {
    super.initState();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        if (username == true) {
          context.go("/navigate");

        } else {
          context.go("/login");
;
        }
      }
    });
  }
    
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/images/network/network_error.svg',
                  width: 250.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FittedBox(
                    child: Text(
                      "Oops, No Internet Connection",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0,),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                      "Make sure wifi or cellular data is turned on \n and then try again",),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

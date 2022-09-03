import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:lottie/lottie.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../constants/shared_constants.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset("assets/images/loading/loading.json"),
      
    );
  }
}

class RecipeLoading extends StatelessWidget {
  const RecipeLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
          padding: const EdgeInsets.only(top: 5.0),
          height: 230.0,
          width: 150.0,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.04),
            borderRadius: BorderRadius.circular(15.0),
          )),
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
        if (username.toString().isNotEmpty) {
          context.go("/navigate");
        } else {
          context.go("/login");
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
                const SizedBox(
                  height: 20.0,
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FittedBox(
                    child: Text(
                      "Oops, No Internet Connection",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    "Make sure wifi or cellular data is turned on \n and then try again",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

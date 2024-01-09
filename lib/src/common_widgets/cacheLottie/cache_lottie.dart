import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CacheLottie extends StatefulWidget {
  const CacheLottie({super.key,required this.path});
  final String path;

  @override
  State<CacheLottie> createState() => _CacheLottieState();
}

class _CacheLottieState extends State<CacheLottie> {
  late final Future<LottieComposition> _composition;

  @override
  void initState() {
    super.initState();

    _composition = NetworkLottie(widget.path).load();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LottieComposition>(
      future: _composition,
      builder: (context, snapshot) {
        var composition = snapshot.data;
        if (composition != null) {
          return Lottie(composition: composition);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

import 'package:app/intro/base.dart';
import 'package:flutter/material.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    List images = ['livine','healthyoptions','stability','progress'];
    List heading = [
      'Welcome to Livine', 
      "We've plenty of healthy options",
      "We assure that you gonna have a Flexible Lifestyle",
      "We gonna show you your progress in your profile"
      ];
      List<Color> textColors = [Colors.black, Colors.white,Colors.white, Colors.white];

    return Scaffold(
      body: ConcentricPageView(
        colors: <Color>[Colors.white, Color(0xfff4CC9F0),Color(0xfffF72585), Color(0xfff3F37C9)],
        itemCount: heading.length, // null = infinity
        physics: NeverScrollableScrollPhysics(),
        curve: Curves.easeInOut,
        direction: Axis.vertical,
        scaleFactor: 5,
        onFinish: () =>  Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext ctx) => Navigation())),

        itemBuilder: (int index, double value) {
          return introScreens(heading[index], 'images/onboarding/${images[index]}.svg', textColors[index]);
        },
      ),
    );
  }
  Widget introScreens (String text , String url, Color textColor) {

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top:100.0),
        child: Column(
          children: [
            SvgPicture.asset(
              url,
              height: 250.0,
            ),
                                SizedBox(
          height: 20.0,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24.0,
            fontFamily: 'BalooBhaina',
            fontWeight: FontWeight.bold,
            color: textColor,
            
            ),
        ),
          ],
        ),
      ),
    );
    
  }
}


// import 'package:app/pages/groceries.dart';
import 'package:app/pages/calendar.dart';
import 'package:app/pages/paitent.dart';
import 'package:app/pages/recipes.dart';
import 'package:app/pages/settings.dart';
import 'package:app/patients/corona.dart';
import './pages/calories_calculator.dart';
import 'package:app/patients/diabetes.dart';
import 'package:app/patients/flu.dart';
import 'package:app/patients/heart.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Misc/Terms.dart';
import 'Misc/privacy.dart';
import 'Recipes/five.dart';
import 'Recipes/four.dart';
import 'Recipes/one.dart';
import 'Recipes/six.dart';
import 'Recipes/three.dart';
import 'Recipes/two.dart';
//import 'Widgets/messaging.dart';
import 'pages/home.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'pages/diet.dart';

void main() => runApp(MaterialApp(
  home: Splash(),
  routes: {
    '/onboarding': (context) => OnBoarding(),
    '/navigate': (context) => Navigation(),
    '/settings': (context) => Settings(),
    '/terms' : (context) => Terms(),
    '/calories_calc' : (context) => Calculator(),
    '/calendar' : (context) => Calendar(),
    '/privacy' : (context) => Privacy(),
    '/heart' : (context) => Heart(),
    '/flu' : (context) => Flu(),
    '/corona' : (context) => Corona(),
    '/diabetes' : (context) => Diabetes(),
    '/r1': (context) => Recipe(),
    '/r2': (context) => SecondRecipe(),
    '/r3': (context) => ThirdRecipe(),
    '/r4': (context) => FourRecipe(),
    '/r5': (context) => FiveRecipe(),
    '/r6': (context) => SixRecipe(),


  },
));

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override

  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 15,
      backgroundColor: Colors.white10,
      image: Image.asset('images/Guava.png'),
      loaderColor: Colors.black,
      photoSize: 200.0,
      navigateAfterSeconds: OnBoarding(),
    );
  }
}


class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentindex = 0;

  final List<Widget> _children = [
    Home(),
    Patient(),
    Recipes(),
    Diet(),
    // Grocery(),
    // Profile(),

  ];

  void onTappedBar(int index) {
    setState(() {
      _currentindex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: _children[_currentindex],
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.blue[800],
        backgroundColor: Colors.transparent,
        items: <Widget>[
          Icon(Icons.tag_faces, size: 30, color: Colors.white),
          Icon(Icons.add, size: 30, color: Colors.white),
          Icon(Icons.fastfood, size: 30, color: Colors.white),
          Icon(Icons.filter_vintage, size: 30, color: Colors.white),
          // Icon(Icons.person_pin, size: 30, color: Colors.white),

        ],
        onTap: ( int index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
    );
  }
}

class OnBoarding extends StatelessWidget {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Image.asset('images/Guava.png'),
        title: 'Welcome to Guava!',
        body: "Together , We build a pure world! Guava is a healthcare & foodplanner application "
            "that will care about your health more than u do",
      ),
      PageViewModel(
          image: Image.asset('images/health.jpg'),
          title: 'Health Treatment',
          body: "We are giving the top doctors' advices to remain healthy, and "
              "we will check you daily because your health is our top priority",
      ),
      PageViewModel(
        image: Image.asset('images/food.jpg'),
        title: 'Healthy Foods',
        body: "We'll recommend top healthy-recipes that're provided by professional chef-bloggers "
            "besides it's ingredients and it's cooking technique ",
      ),
      PageViewModel(
        image: Image.asset('images/sick.jpg'),
        title: 'Situations!',
        body: "Don't Worry! We will make sure that you'll be provided per your health situation and "
            "we won't stop caring ",
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        done: Text('Get Started', style: TextStyle(color: Colors.black),),
        globalBackgroundColor: Colors.white,
        pages: getPages(),
        onDone: () => Navigator.pushNamed(context, '/navigate'),
      ),
    );
  }
}




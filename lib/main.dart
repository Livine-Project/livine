import 'package:app/auth/login.dart';
import 'package:app/auth/register.dart';
import 'package:app/auth/reset_password.dart';
import 'package:app/pages/calendar.dart';
import 'package:app/pages/paitent.dart';
import 'package:app/pages/recipes.dart';
import 'package:app/pages/settings.dart';
import 'package:app/pages/working_out.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './pages/calories_calculator.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Misc/Terms.dart';
import 'Misc/privacy.dart';
import 'Others/theme.dart';
import 'Recipes/eight.dart';
import 'Recipes/five.dart';
import 'Recipes/four.dart';
import 'Recipes/nine.dart';
import 'Recipes/one.dart';
import 'Recipes/seven.dart';
import 'Recipes/six.dart';
import 'Recipes/ten.dart';
import 'Recipes/three.dart';
import 'Recipes/two.dart';
import 'details/patient_detail.dart';
import 'pages/home.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'pages/diet.dart';

bool dark = false;
var email;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  dark = prefs.getBool('dark') ?? false;
  email = prefs.getString('email');
  runApp(MyApp());
}

  class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => !dark ? ThemeChanger(ThemeData.light()): ThemeChanger(ThemeData.dark()),
      child: new MaterialAppWithTheme(),
    );

  }
}
class MaterialAppWithTheme extends StatefulWidget {
  @override
  _MaterialAppWithThemeState createState() => _MaterialAppWithThemeState();
}

class _MaterialAppWithThemeState extends State<MaterialAppWithTheme> {


  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      home: email == null ? Login() : Navigation(),
      theme: theme.getTheme(),
      routes: {
        '/onboarding': (context) => OnBoarding(),
        '/food': (context) => Foods(),
        '/navigate': (context) => Navigation(),
        '/settings': (context) => Settings(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/reset_password': (context) => Reset_Password(),
        '/terms' : (context) => Terms(),
        '/calories_calc' : (context) => Calculator(),
        '/calendar' : (context) => Calendar(),
        '/privacy' : (context) => Privacy(),
        '/r1': (context) => Recipe(),
        '/r2': (context) => SecondRecipe(),
        '/r3': (context) => ThirdRecipe(),
        '/r4': (context) => FourRecipe(),
        '/r5': (context) => FiveRecipe(),
        '/r6': (context) => SixRecipe(),
        '/r7': (context) => SevenRecipe(),
        '/r8': (context) => EightRecipe(),
        '/r9': (context) => NineRecipe(),
        '/r10': (context) => TenRecipe(),
      },
    );
  }
}



// class Splash extends StatefulWidget {
//   @override
//   _SplashState createState() => _SplashState();
// }

// class _SplashState extends State<Splash> {


//   @override

//   Widget build(BuildContext context) {
//     return SplashScreen(
//       seconds: 15,
//       backgroundColor: Colors.white10,
//       image: Image.asset('images/Guava.png'),
//       loaderColor: Colors.black,
//       photoSize: 200.0,
//     );
//   }
// }


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
    WorkingOut(),
    //Grocery(),
    // Profile(),

  ];

  void onTappedBar(int index) {
    setState(() {
      _currentindex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: _children[_currentindex],
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: (theme.getTheme() == ThemeData.dark() ) ? Colors.grey[900] : Colors.blue[800],
        backgroundColor: Colors.transparent,
        items: <Widget>[
          Icon(FontAwesomeIcons.laughBeam, size: 30, color: Colors.white),
          Icon(FontAwesomeIcons.heartbeat, size: 30, color: Colors.white),
          Icon(FontAwesomeIcons.appleAlt, size: 30, color: Colors.white),
          Icon(FontAwesomeIcons.spa, size: 30, color: Colors.white),
          Icon(FontAwesomeIcons.dumbbell, size: 30, color: Colors.white),

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
          image: Image.asset('images/onboarding/health2.png'),
          title: 'Health Treatment',
          body: "We are giving the top doctors' advices to remain healthy, and "
              "we will check you daily because your health is our top priority",
      ),
      PageViewModel(
        image: Image.asset('images/onboarding/cooking.png'),
        title: 'Healthy Foods',
        body: "We'll recommend top healthy-recipes that're provided by professional chef-bloggers "
            "besides it's ingredients and it's cooking technique ",
      ),
      PageViewModel(
        image: Image.asset('images/onboarding/medical.png'),
        title: 'Situations!',
        body: "Don't Worry! We will make sure that you'll be provided per your health situation and "
            "we won't stop caring ",
      ),
      PageViewModel(
        image: Image.asset('images/onboarding/working_out.png'),
        title: 'Working Out',
        body: "The perfect mind comes with a healthy body, so we are recommending some excersies for you to make your body remains in its health shape ",
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: IntroductionScreen(
        done: Text('Get Started', style: TextStyle(color: Colors.black),),
        globalBackgroundColor: (theme.getTheme() == ThemeData.dark() ) ? Colors.grey[850] : Colors.white,
        pages: getPages(),
        onDone: () => Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext ctx) => Navigation())),
      ),
    );
  }
}




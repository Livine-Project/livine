import 'package:app/Others/theme.dart';
import 'package:app/Others/utisl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Others/moods.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      backgroundColor: (theme.getTheme() == ThemeData.dark())
          ? Colors.grey[850]
          : mainBgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(82, 136, 242, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            headerDecoration(size, context),
            recomendedSectionHomeView(),
            Container(
              margin: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 20.0),
              width: size.width * 0.4,
              child: Column(
                children: [
                  Image.asset('images/recipes/chiken.jpg'),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(color: Colors.white, 
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    boxShadow: [
                      
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50.0,
                        color: Colors.blueAccent.withOpacity(0.23),
                      )
                    ]),
                    child: Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: "Chicken \n".toUpperCase(),style: Theme.of(context).textTheme.button),
                              TextSpan(
                                text: "Chief".toUpperCase(), style: TextStyle(color: Colors.red.withOpacity(0.5),)
                              ),
                            ],
                          ),
                        
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container recomendedSectionHomeView() {
    return Container(
      height: 24,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text("Recomended",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Spacer(),
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {},
                  child: Text("More", style: TextStyle(color: Colors.white)),
                  color: Color.fromRGBO(85, 217, 204, 1),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container headerDecoration(Size size, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      height: size.height * 0.2,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.2 - 27,
            decoration: BoxDecoration(
              color: Color.fromRGBO(82, 136, 242, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36.0),
                bottomRight: Radius.circular(36.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 35.0),
            child: Row(
              children: [
                Text(
                  "Welcome Mazen",
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFloatingSearchBar() {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        // Call your model, bloc, controller here.
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.emoji_food_beverage),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: Colors.accents.map((color) {
                return Container(height: 112, color: color);
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

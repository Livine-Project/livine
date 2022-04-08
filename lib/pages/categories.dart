// import 'package:cloud_firestore/cloud_firestore.dart';
// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';


import 'package:flutter/material.dart';

class Patient extends StatefulWidget {
  @override
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  int screenCrossCount() {
    if (ResponsiveWrapper.of(context).isTablet) {
      return 1;
    } 
    else if (ResponsiveWrapper.of(context).isMobile) {
      if (ResponsiveWrapper.of(context).orientation == Orientation.portrait)
        return 1;
      else {
        return 2;
      }
    }
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[900]
          : Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0),
          child: OrientationBuilder(
            builder: ((context, orientation) => GridView.count(
                  crossAxisCount: screenCrossCount(),
                  childAspectRatio: 3,
                  shrinkWrap: true,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 10,
                  children: [
                    FoodCategory(
                      navigate: '/breakfast',
                      name: 'Breakfast',
                      image:
                          "https://top10cairo.com/wp-content/uploads/2015/12/best-breakfast-places-cairo-696x364.jpg",
                      color: Color(0xfff3f37c9),
                    ),
                    FoodCategory(
                      navigate: '/lunch',
                      name: 'Lunch',
                      image:
                          "https://media.istockphoto.com/photos/keto-diet-foods-picture-id1096945386?b=1&k=20&m=1096945386&s=170667a&w=0&h=whc_B9ltl294rfVBmpu84DB5QxQGjof8KGtAvXjDDfw=",
                      color: Color(0xfff3f37c9),
                    ),
                    FoodCategory(
                      navigate: '/dinner',
                      name: 'Dinner',
                      image:
                          "https://images.unsplash.com/photo-1611765083444-a3ce30f1c885?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGRpbm5lcnxlbnwwfHwwfHw%3D&w=1000&q=80",
                      color: (Colors.tealAccent[400])!,
                    ),
                    FoodCategory(
                      navigate: '/snacks',
                      name: 'Snacks',
                      image:
                          "https://images.unsplash.com/photo-1621939514649-280e2ee25f60?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c25hY2t8ZW58MHx8MHx8&w=1000&q=80",
                      color: (Colors.tealAccent[400])!,
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

class FoodCategory extends StatelessWidget {
  const FoodCategory({
    Key? key,
    required this.navigate,
    required this.image,
    required this.name,
    required this.color,
  }) : super(key: key);

  final String navigate;
  final String image;
  final String name;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(navigate),
      child: Container(
        width: 350,
        height: 120,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey[900]
              : color,
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 0.05),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
            child: Text(
              name,
              style: TextStyle(
                  color: Color(0xfff80ed99),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Kine'),
            ),
          ),
        ),
      ),
    );
  }
}

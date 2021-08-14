import 'package:app/Others/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Profile extends StatelessWidget {
  Profile({Key key}) : super(key: key);

  List texts = ['Callories','Water'];
  List urls = [
'https://images.vexels.com/media/users/3/130343/isolated/preview/617e25c481c3d5c6d536ad89260c99f7-flat-colorful-pie-chart.png',
'https://www.nicepng.com/png/detail/2-23770_art-base-water-drops-clip-art-logo-design.png',

];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            // backgroundColor: context.read(themeProvider).themeMode = ThemeMode.dark;
      //     ? Colors.grey[900]
      //     : Color(0xfff4895EF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0)),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 105.0),
                    child: userImage(
                      name: 'Mazen Omar',
                      url:
                          'https://www.kindpng.com/picc/m/22-223941_transparent-avatar-png-male-avatar-icon-transparent-png.png',
                    ),
                  ),
                ),
              ],
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              children: List.generate(2, (index) {
                return Container(
                  height: 100.0,
                  child: Center(
                    child: profileCard(
                      name: texts[index],
                      url: urls[index],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class profileCard extends StatelessWidget {
  const profileCard({
    Key key,
    @required this.name,
    @required this.url,
  }) : super(key: key);

  final name;
  final url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.0,
      height: 170.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.red,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              name,
              style: GoogleFonts.bebasNeue(
                letterSpacing: 2,
              ),
            ),
          ),
          Image(
            width: 100.0,
            image: NetworkImage(url),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class userImage extends StatelessWidget {
  const userImage({
    Key key,
    @required this.name,
    @required this.url,
  }) : super(key: key);

  final name;
  final url;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
            BoxShadow(blurRadius: 50.0, spreadRadius: 2),
          ]),
          child: CircleAvatar(
            backgroundImage: NetworkImage(url),
            radius: 65.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

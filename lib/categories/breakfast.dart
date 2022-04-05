// ignore_for_file: prefer_typing_uninitialized_variables, type_annotate_public_apis

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BreakFast extends StatelessWidget {
  const BreakFast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BreakFast'),
        centerTitle: true,
        elevation: 1.2,
        // ignore: use_full_hex_values_for_flutter_colors
        backgroundColor: Theme.of(context).brightness == Brightness.dark ?Colors.grey[800] :Colors.blueAccent[700],
      ),
        body: OrientationBuilder(
          builder: (context, orientation) => 
          GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 1 :2, 
          physics: BouncingScrollPhysics(),
          children: const [
            Category(
              url: 'https://www.youtube.com/watch?v=618QsMaVXp8',
                image: 'assets/images/calories/breakfast/shakshuka.jpg',
                name: 'Shakshuka',
              ),
            Category(
              url: 'https://www.youtube.com/watch?v=bXntiogB8rA',
              image: 'assets/images/calories/breakfast/crustless.jpg',
              name: 'Crustless Quiche',
            ),
            Category(
              url: 'https://www.youtube.com/watch?v=n76noIAaAuY',
              image: 'assets/images/calories/breakfast/burrito.jpg',
              name: 'Burrito',
            ),
            Category(
              url: 'https://www.youtube.com/watch?v=4STUMnTxcsA',
              image: 'assets/images/calories/breakfast/blueberry.jpg',
              name: 'Baked Oatmeal',
            ),
            Category(
              url: 'https://www.youtube.com/watch?v=Sncq3NLw_PY',
              image: 'assets/images/calories/breakfast/apple.jpg',
              name: 'Apple Cinnamon Oat',
            ),
            Category(
              url: 'https://www.youtube.com/watch?v=0W9lXaHcXL4',
              image: 'assets/images/calories/breakfast/banana.jpg',
              name: 'Banana Bread',
            ),
            Category(
              url: 'https://www.youtube.com/watch?v=iR64hfkGQeU' ,
              image: 'assets/images/calories/breakfast/waffles.jpg',
              name: 'Waffles',
            ),
              
          ],),
        ),);
  }
}

class Category extends StatelessWidget {
  const Category({
    Key? key,
    required this.image,
    required this.name,
     required this.url,

  }) : super(key: key);

  final image;
  final name;
  final url;

  _launchCategoryURL() async {
    
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: GestureDetector(
        onTap: _launchCategoryURL,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 10.0,
          child: Column(
            children: [
              Image.asset('$image',
              height: 260.0,
              width: 400.0,
              fit: BoxFit.cover,
              ),
              SizedBox(height: 10.0),
              Text('$name', style: TextStyle(fontSize: 24.0),)
            ],
          ),
        ),
      ),
    );
  }
}

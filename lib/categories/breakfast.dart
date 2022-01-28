// ignore_for_file: prefer_typing_uninitialized_variables, type_annotate_public_apis

import 'package:flutter/material.dart';

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
        body: GridView.count(crossAxisCount: 1, 
        physics: BouncingScrollPhysics(),
        children: const [
          Category(
              image: 'images/calories/breakfast/shakshuka.jpg',
              name: 'Shakshuka',
            ),
          Category(
            image: 'images/calories/breakfast/crustless.jpg',
            name: 'Crustless Quiche',
          ),
          Category(
            image: 'images/calories/breakfast/burrito.jpg',
            name: 'Burrito',
          ),
          Category(
            image: 'images/calories/breakfast/blueberry.jpg',
            name: 'Baked Oatmeal',
          ),
          Category(
            image: 'images/calories/breakfast/apple.jpg',
            name: 'Apple Cinnamon Oat',
          ),
          Category(
            image: 'images/calories/breakfast/banana.jpg',
            name: 'Banana Bread',
          ),
          Category(
            image: 'images/calories/breakfast/waffles.jpg',
            name: 'Waffles',
          ),
            
        ],),);
  }
}

class Category extends StatelessWidget {
  const Category({
    Key? key,
    required this.image,
    required this.name,

  }) : super(key: key);

  final image;
  final name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
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
    );
  }
}

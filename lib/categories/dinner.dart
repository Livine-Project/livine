import 'package:app/categories/breakfast.dart';
import 'package:flutter/material.dart';

class Dinner extends StatelessWidget {
  const Dinner({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text('Dinner'),
        centerTitle: true,
        elevation: 1.2,
        backgroundColor: Color(0xfff4361EE),
      ),
        body: GridView.count(crossAxisCount: 1, 
        children: [
            Category(
              image: 'images/calories/dinner/mush.jpg',
              name: 'Wild Mushroom Risotto',
            ),
          Category(
            image: 'images/calories/dinner/salad.jpg',
            name: 'Grilled Steak Tortilla Salad',
          ),
          Category(
            image: 'images/calories/dinner/shrimp.jpg',
            name: 'Feta Shrimp and Polenta',
          ),
          Category(
            image: 'images/calories/dinner/mike.jpg',
            name: 'Black Bean Soup',
          ),
          Category(
            image: 'images/calories/dinner/bass.jpg',
            name: 'Bass With Radish Salsa ',
          ),
          Category(
            image: 'images/calories/dinner/eggplant.jpg',
            name: 'Eggplant Parmesan',
          ),
        ],));
  }
}
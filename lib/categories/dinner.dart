import 'breakfast.dart';
import 'package:flutter/material.dart';

class Dinner extends StatelessWidget {
  const Dinner({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text('Dinner'),
        centerTitle: true,
        elevation: 1.2,
        // ignore: use_full_hex_values_for_flutter_colors
        backgroundColor: Theme.of(context).brightness == Brightness.dark ?Colors.grey[800] :Colors.blueAccent[700],
      ),
        body: GridView.count(crossAxisCount: 1, 
        children: const [
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
        ],),);
  }
}

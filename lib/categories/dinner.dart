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
        body: OrientationBuilder(
          builder: ((context, orientation) => 
          GridView.count(crossAxisCount: orientation == Orientation.portrait ? 1 : 2, 
          children: const [
              Category(
                url: 'https://www.youtube.com/watch?v=-oxjhgVp4y4',
                image: 'assets/images/calories/dinner/mush.jpg',
                name: 'Wild Mushroom Risotto',
              ),
            Category(
              url: 'https://www.youtube.com/watch?v=vUcP8tYFvio',
              image: 'assets/images/calories/dinner/salad.jpg',
              name: 'Grilled Steak Tortilla Salad',
            ),
            Category(
              url: 'https://www.youtube.com/watch?v=CbzOZVC-la0',
              image: 'assets/images/calories/dinner/shrimp.jpg',
              name: 'Feta Shrimp and Polenta',
            ),
            Category(
              url: 'https://www.youtube.com/watch?v=mTwBK39EWok',
              image: 'assets/images/calories/dinner/mike.jpg',
              name: 'Black Bean Soup',
            ),
            Category(
              url: 'https://www.youtube.com/watch?v=_v8uQPFp2ZA',
              image: 'assets/images/calories/dinner/bass.jpg',
              name: 'Bass With Radish Salsa ',
            ),
            Category(
              url: 'https://www.youtube.com/watch?v=6JfeZL14L48',
              image: 'assets/images/calories/dinner/eggplant.jpg',
              name: 'Eggplant Parmesan',
            ),
          ],)),
        ),);
  }
}

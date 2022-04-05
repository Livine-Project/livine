import 'breakfast.dart';
import 'package:flutter/material.dart';

class Snacks extends StatelessWidget {
  const Snacks({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
          return Scaffold(
      appBar: AppBar(
        title: Text('Snacks'),
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
              url: 'https://www.youtube.com/watch?v=DeeBmd7OaX0',
              image: 'assets/images/calories/snacks/nuts.jpg',
              name: 'Mixed Nuts',
            ),
          Category(
            url: 'https://www.youtube.com/results?search_query=Red+pepper+guacamole',
            image: 'assets/images/calories/snacks/red.jpg',
            name: 'Red pepper guacamole',
          ),
          Category(
            url: 'https://www.youtube.com/watch?v=z0uTL_ZOOoY',
            image: 'assets/images/calories/snacks/yogurt.jpg',
            name: 'Yogurt with mixed berries',
          ),
          Category(
            url: 'https://www.youtube.com/watch?v=iD2HVkiE_us',
            image: 'assets/images/calories/snacks/apple.jpg',
            name: 'Apple slices with peanut',
          ),
          Category(
            url: 'https://www.youtube.com/watch?v=SW0UkfgrQNg',
            image: 'assets/images/calories/snacks/cottage.jpg',
            name: 'Cottage cheese',
          ),
          Category(
            url: 'https://www.youtube.com/watch?v=PztY4NAyqoI',
            image: 'assets/images/calories/snacks/cheese.jfif',
            name: 'Celery sticks with Cheese',
          ),
        ],)),
        ),
          
        );
  }
}

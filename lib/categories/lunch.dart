import 'breakfast.dart';
import 'package:flutter/material.dart';

class Lunch extends StatelessWidget {
  const Lunch({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text('Lunch'),
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
              url: 'https://www.youtube.com/watch?v=PAELd9i4yWY',
              image: 'assets/images/calories/lunch/tacos.jpg',
              name: 'Roasted Cauliflower Tacos',
            ),
          Category(
            url: 'https://www.youtube.com/watch?v=179z0T5SnbQ',
            image: 'assets/images/calories/lunch/salad.png',
            name: 'Carrot with Radish Salad',
          ),
          Category(
            url: 'https://www.youtube.com/watch?v=vbV1h68Mnms',
            image: 'assets/images/calories/lunch/salmon.jpg',
            name: 'Salmon Salad',
          ),
          Category(
            url: 'https://www.youtube.com/watch?v=J-Rn9DN3IjU',
            image: 'assets/images/calories/lunch/panzanella.jpg',
            name: 'Panzanella',
          ),
          Category(
            url: 'https://www.youtube.com/watch?v=a4Z2x0sPq3A',
            image: 'assets/images/calories/lunch/caesar.jpg',
            name: 'Caesar Salad',
          ),
        ],
        )),
        ),
        );
  }
}

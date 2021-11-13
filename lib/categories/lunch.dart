import 'package:app/categories/breakfast.dart';
import 'package:flutter/material.dart';

class Lunch extends StatelessWidget {
  const Lunch({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text('Lunch'),
        centerTitle: true,
        elevation: 1.2,
        backgroundColor: Color(0xfff4361EE),
      ),
        body: GridView.count(crossAxisCount: 1, 
        children: [
            Category(
              image: 'images/calories/lunch/tacos.jpg',
              name: 'Roasted Cauliflower Tacos',
            ),
          Category(
            image: 'images/calories/lunch/salad.png',
            name: 'Carrot with Radish Salad',
          ),
          Category(
            image: 'images/calories/lunch/salmon.jpg',
            name: 'Salmon Salad',
          ),
          Category(
            image: 'images/calories/lunch/panzanella.jpg',
            name: 'Panzanella',
          ),
          Category(
            image: 'images/calories/lunch/caesar.jpg',
            name: 'Caesar Salad',
          ),
        ],));
  }
}
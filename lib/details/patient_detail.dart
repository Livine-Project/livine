// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Foods extends StatefulWidget {

  // final DocumentSnapshot food;
  // Foods({this.food});

  @override
  _FoodsState createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foods'),
        backgroundColor: Colors.red,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          // new Container(
          //   child: Card(
          //     elevation: 10.0,
          //     child: Column(
          //       children:[
          //         Image.network(
          //           '${widget.food.data()['food_1_img']}',
          //           fit: BoxFit.cover,
          //           height: 140.0,
          //           width: 200.0,
          //         ),
          //         SizedBox(height: 5.0),

          //         Padding(
          //           padding: EdgeInsets.only(right: 5.0, left: 5.0),
          //           child: Text(
          //             widget.food.data.call()['food_1'],
          //             style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               color: Colors.red,
          //               fontSize: 15.0,
          //             ),
          //           ),
          //         ),


          //       ],


          //     ),

          //   ),
          // ),
          // new Container(
          //   child: Card(
          //     elevation: 10.0,
          //     child: Column(
          //       children:[
          //         Image.network(
          //           '${widget.food.data()['food_2_img']}',
          //           fit: BoxFit.cover,
          //           height: 140.0,
          //           width: 200.0,
          //         ),
          //         SizedBox(height: 5.0),

          //         Padding(
          //           padding: EdgeInsets.only(right: 5.0, left: 5.0),
          //           child: Text(
          //             widget.food.data()['food_2'],
          //             style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               color: Colors.red,
          //               fontSize: 20.0,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // new Container(
          //   child: Card(
          //     elevation: 10.0,
          //     child: Column(
          //       children:[
          //         Image.network(
          //           '${widget.food.data()['food_3_img']}',
          //           fit: BoxFit.cover,
          //           height: 140.0,
          //           width: 200.0,
          //         ),
          //         SizedBox(height: 5.0),

          //         Padding(
          //           padding: EdgeInsets.only(right: 5.0, left: 5.0),
          //           child: Text(
          //             widget.food.data()['food_3'],
          //             style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               color: Colors.red,
          //               fontSize: 20.0,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // new Container(
          //   child: Card(
          //     elevation: 10.0,
          //     child: Column(
          //       children:[
          //         Image.network(
          //           '${widget.food.data()['food_4_img']}',
          //           fit: BoxFit.cover,
          //           height: 140.0,
          //           width: 200.0,
          //         ),
          //         SizedBox(height: 5.0),

          //         Padding(
          //           padding: EdgeInsets.only(right: 5.0, left: 5.0),
          //           child: Text(
          //             widget.food.data()['food_4'],
          //             style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               color: Colors.red,
          //               fontSize: 20.0,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // new Container(
          //   child: Card(
          //     elevation: 10.0,
          //     child: Column(
          //       children:[
          //         Image.network(
          //           '${widget.food.data()['food_5_img']}',
          //           fit: BoxFit.cover,
          //           height: 140.0,
          //           width: 200.0,
          //         ),
          //         SizedBox(height: 5.0),

          //         Padding(
          //           padding: EdgeInsets.only(right: 5.0, left: 5.0),
          //           child: Text(
          //             widget.food.data()['food_5'],
          //             style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               color: Colors.red,
          //               fontSize: 15.0,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // new Container(
          //   child: Card(
          //     elevation: 10.0,
          //     child: Column(
          //       children:[
          //         Image.network(
          //           '${widget.food.data()['food_6_img']}',
          //           fit: BoxFit.cover,
          //           height: 140.0,
          //           width: 200.0,
          //         ),
          //         SizedBox(height: 5.0),

          //         Padding(
          //           padding: EdgeInsets.only(right: 5.0, left: 5.0),
          //           child: Text(
          //             widget.food.data()['food_6'],
          //             style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               color: Colors.red,
          //               fontSize: 20.0,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // new Container(
          //   child: Card(
          //     elevation: 10.0,
          //     child: Column(
          //       children:[
          //         Image.network(
          //           '${widget.food.data()['food_7_img']}',
          //           fit: BoxFit.cover,
          //           height: 140.0,
          //           width: 200.0,
          //         ),
          //         SizedBox(height: 5.0),

          //         Padding(
          //           padding: EdgeInsets.only(right: 5.0, left: 5.0),
          //           child: Text(
          //             widget.food.data()['food_7'],
          //             style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               color: Colors.red,
          //               fontSize: 20.0,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // new Container(
          //   child: Card(
          //     elevation: 10.0,
          //     child: Column(
          //       children:[
          //         Image.network(
          //           '${widget.food.data()['food_8_img']}',
          //           fit: BoxFit.cover,
          //           height: 140.0,
          //           width: 200.0,
          //         ),
          //         SizedBox(height: 5.0),

          //         Padding(
          //           padding: EdgeInsets.only(right: 5.0, left: 5.0),
          //           child: Text(
          //             widget.food.data()['food_8'],
          //             style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               color: Colors.red,
          //               fontSize: 20.0,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
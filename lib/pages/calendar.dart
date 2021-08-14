import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],

      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
          ],
        ),
      ),
      
    );
  }
}
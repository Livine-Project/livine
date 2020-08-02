import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  int num1 = 0;
  double sum =0, num3 =0;
  String num2, num4;

  final TextEditingController t1 = new TextEditingController();
  final TextEditingController t2 = new TextEditingController();
  final TextEditingController t3 = new TextEditingController();
  final TextEditingController t4 = new TextEditingController();

  void Calculate(){
    setState(() {
      num1 = int.parse(t1.text);
      num2 = t2.text;
      num3 = double.parse(t3.text);
      num4 = t4.text;
      
      if (num4 == 'vlight' || num4 == 'verylight' || num4 == 'very light' ) {

        num4 = '1.3';

      }
      else if (num4 == 'light') {
        num4 = '1.55';
      }
      else if (num4 == 'moderate') {
        num4 = '1.65';
      }
      else if (num4 == 'heavy') {
        num4 = '1.80';
      }
      else if (num4 == 'vheavy' || num4 == 'veryheavy' || num4 == 'very heavy' ) {
        num4 = '2.00';
      }
    

      if (num2 == 'male'|| num2 == 'Male') {
        String num2 = '1.0';
        sum = num1 * double.parse(num2);
        sum = sum * 24;
        if (num3 >= 10 && num3 <=14 ) {
          num3 = 1.0;
          sum = sum * num3;
          sum = sum * double.parse(num4);
        }
        else if (num3 >= 15 && num3 <=20) {
          num3 = 0.95;
          sum = sum * num3;
          sum = sum * double.parse(num4);


        }
         else if (num3 >= 21 && num3 <=28) {
          num3 = 0.90;
          sum = sum * num3;
          sum = sum * double.parse(num4);


        }
         else if (num3 >=28) {
          num3 = 0.85;
          sum = sum * num3;
          sum = sum * double.parse(num4);


        }

      }
      else if (num2 == 'female' || num2 == 'Female') {
        String num2 = '0.9';
        sum = num1 * double.parse(num2);
        sum = sum * 24;

        if (num3 >= 14 && num3 <=18 ) {
          num3 = 1.0;
          sum = sum * num3;
          sum = sum * double.parse(num4);

        }
        else if (num3 >= 19 && num3 <=28) {
          num3 = 0.95;
          sum = sum * num3;
          sum = sum * double.parse(num4);

        }
         else if (num3 >= 29 && num3 <=38) {
          num3 = 0.90;
          sum = sum * num3;
          sum = sum * double.parse(num4);

        }
         else if (num3 >=38) {
          num3 = 0.85;
          sum = sum * num3;
          sum = sum * double.parse(num4);

        }      
        }
      

    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.greenAccent[400],
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Body weight in kg",
                ),
                controller: t1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Gender: Male , Female",
                ),
                controller: t2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Body fat",
                ),
                controller: t3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "vlight ,light ,moderate ,heavy , vheavy",
                ),
                controller: t4,
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                color: Colors.greenAccent,

                child: Text("Calculate"),
                onPressed: Calculate,
              ),
            ),
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("You need $sum calories per day")
            ),
            
            
          ],
        ),
      ),
    );
  }
}
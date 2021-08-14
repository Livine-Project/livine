
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Patient extends StatefulWidget {
  @override
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  // CollectionReference  patientsCollection = FirebaseFirestore.instance.collection('patients');

  // navigateToDetail(DocumentSnapshot food){
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => Foods(food: food)));
  // }
  @override
  Widget build(BuildContext context) {
    // final theme = Provider.of<AppTheme>(context);
    return Scaffold(
      // backgroundColor: context.read(themeProvider).themeMode = ThemeMode.dark;
      //     ? Colors.grey[900]
      //     : Color(0xfff4895EF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                CaloriesCounter(),
                Padding(
                  padding: const EdgeInsets.only(top: 240.0, left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          patientCatogeries(
                            text: 'Breakfast',
                          ),
                          patientCatogeries(
                            text: 'Lunch',
                          ),
                          patientCatogeries(
                            text: 'Dinner',
                          ),
                        ],
                      ),
                      //TODO: ADD FOOD RECIPES AND HOW TO COOK IN EACH MEAL!!
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Recommended",
                        style: GoogleFonts.bebasNeue(
                            letterSpacing: 2,
                            fontWeight: FontWeight.w100,
                            fontSize: 25.0,
                            color: Colors.white),
                      ),
                      CatogeryWidget(
                        url: 'images/calories/egg.jfif',
                        food: 'Egg Omelette',
                      ),
                      SizedBox(height: 20.0,),
                      CatogeryWidget(
                        url: 'images/calories/yogurt.png',
                        food: 'Yogurt',
                      ),
                                          SizedBox(height: 20.0,),
                      CatogeryWidget(
                        url: 'images/calories/yogurt.png',
                        food: 'Yogurt',
                      ),
                                          SizedBox(height: 20.0,),
                      CatogeryWidget(
                        url: 'images/calories/yogurt.png',
                        food: 'Yogurt',
                      ),
                    ],
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class CatogeryWidget extends StatelessWidget {
  const CatogeryWidget({
    Key key,
    @required this.url,
    @required this.food,
  }) : super(key: key);
  final String url;
  final String food;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      width: 370.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            fit: BoxFit.cover,
            image: AssetImage(url),
          ),
          SizedBox(
            width: 60.0,
          ),
          Text(
            food,
            style: GoogleFonts.bebasNeue(
              fontSize: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}

class patientCatogeries extends StatelessWidget {
  const patientCatogeries({
    Key key,
    @required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 90.0,
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.bebasNeue(
            fontSize: 18.0,
          ),
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25.0)),
    );
  }
}

class CaloriesCounter extends StatelessWidget {
  const CaloriesCounter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          startAngle: 180,
          endAngle: 360,
          showTicks: false,
          showLabels: true,
          canScaleToFit: false,
          radiusFactor: 0.8,
          minimum: 0,
          maximum: 2500,
          axisLineStyle: const AxisLineStyle(thickness: 40),
          pointers: <GaugePointer>[
            const RangePointer(
              enableAnimation: true,
              animationType: AnimationType.easeOutBack,
              width: 40,
              color: Color(0xFF00A8B5),
              value: 1200, // Pointer stops at
              gradient: SweepGradient(
                  colors: <Color>[Color(0xfff560BAD), Color(0xfff3F37C9)],
                  stops: <double>[0.25, 0.75]),
            ),
            NeedlePointer(
                knobStyle: KnobStyle(
                    color: Colors.black,
                    knobRadius: 2,
                    sizeUnit: GaugeSizeUnit.logicalPixel),
                needleEndWidth: 2,
                needleStartWidth: 2,
                needleColor: Colors.black,
                lengthUnit: GaugeSizeUnit.factor,
                needleLength: 0.98,
                value: 1200, //Needle stops at
                enableAnimation: true,
                animationType: AnimationType.easeOutBack)
          ],
          annotations: [
            GaugeAnnotation(
              widget: Container(
                child: Text("Callories",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 24.0,
                      color: Colors.white
                    )),
              ),
              angle: 90,
              positionFactor: 0.15,
            ),
          ],
        ),
      ],
    );
  }
}

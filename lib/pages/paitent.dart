import 'package:app/Others/theme.dart';
import 'package:app/details/patient_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Patient extends StatefulWidget {
  @override
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<Patient> {
 Future getPosts() async{
   var firestore = Firestore.instance;
   QuerySnapshot qn = await firestore.collection('patients').getDocuments();
   return qn.documents;
 }
 navigateToDetail(DocumentSnapshot food){
   Navigator.push(context, MaterialPageRoute(builder: (context) => Foods(food: food)));
 }
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient"),
        backgroundColor: (theme.getTheme() == ThemeData.dark() ) ? Colors.grey[900] : Colors.blue[800],
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () =>  Navigator.pushNamed(context, '/settings')
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
          future: getPosts(),
          builder: (_,snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("Loading"),);
          } else{
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (_,index){
                return GestureDetector(
                  onTap: () => navigateToDetail(snapshot.data[index]),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
                    margin: EdgeInsets.only(
                      bottom: 5.0,
                      top: 15.0,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1.0,
                            blurRadius: 6.0,
                          ),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Color(0xFFD9D9D9),
                              backgroundImage: NetworkImage('${snapshot.data[index].data['image']}'),
                              radius: 36.0,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      height: 1.3,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: snapshot.data[index].data['name'],
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 6.0,
                                ),

                              ],

                            ),

                          ],

                        ),
                      ],
                    ),
                  ),
                );
              });

          }
        },),
      ),
    );
  }
}



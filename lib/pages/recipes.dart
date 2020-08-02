import 'package:app/Others/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Recipes extends StatefulWidget {

  @override
  _RecipesState createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: (theme.getTheme() == ThemeData.dark() ) ? Colors.grey[900] : Colors.blue[800],
        title: Text('Recipes'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.settings),
              onPressed: () => Navigator.pushNamed(context, '/settings')),
        ],

      ),
      body: ListView(

        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/r1'),
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: myDetailsContainer1(),
                            ),
                          ),

                          Container(
                            width: 250,
                            height: 200,
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(24.0),
                              child:GestureDetector(
                                onTap: () => Navigator.pushNamed(context, '/r1'),
                                child: Image(
                                  fit: BoxFit.contain,
                                  alignment: Alignment.topRight,
                                  image: AssetImage('images/recipes/chiken.jpg'),
                                ),
                              ),
                            ),
                          ),
                        ]
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(

                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/r2'),
                  child: Material(
                      color: Colors.white,
                      elevation: 14.0,
                      borderRadius: BorderRadius.circular(24.0),
                      shadowColor: Color(0x802196F3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: myDetailsContainer4(),
                            ),
                          ),

                          Container(
                            width: 250,
                            height: 180,
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(24.0),
                              child: Image(
                                fit: BoxFit.contain,
                                alignment: Alignment.topRight,
                                image: NetworkImage('https://food.fnr.sndimg.com/content/dam/images/food/fullset/2013/2/14/0/FNK_Herbed-Chicken-Marsala_s4x3.jpg.rend.hgtvcom.826.620.suffix/1371614296995.jpeg'),
                            ),
                          )
                          ),
                        ],)
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/r3'),
                  child: Material(
                      color: Colors.white,
                      elevation: 14.0,
                      borderRadius: BorderRadius.circular(24.0),
                      shadowColor: Color(0x802196F3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: myDetailsContainer3(),
                            ),
                          ),

                          Container(
                            width: 250,
                            height: 180,
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(24.0),
                                child: Image(
                                  fit: BoxFit.contain,
                                  alignment: Alignment.topRight,
                                  image: AssetImage(
                                      'images/recipes/yogurt-cake.jpeg'),
                                ),
                              ),
                          ),
                        ],)
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/r4'),
                  child: Material(
                      color: Colors.white,
                      elevation: 14.0,
                      borderRadius: BorderRadius.circular(24.0),
                      shadowColor: Color(0x802196F3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: myDetailsContainer2(),
                            ),
                          ),

                          Container(
                            width: 250,
                            height: 180,
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(24.0),
                              child: Image(
                                fit: BoxFit.contain,
                                alignment: Alignment.topRight,
                                image: AssetImage("images/recipes/beef.jpeg"),
                              ),),
                          ),
                        ],)
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/r5'),
                  child: Material(
                      color: Colors.white,
                      elevation: 14.0,
                      borderRadius: BorderRadius.circular(24.0),
                      shadowColor: Color(0x802196F3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: myDetailsContainer5(),
                            ),
                          ),

                          Container(
                            width: 250,
                            height: 180,
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(24.0),
                              child: Image(
                                fit: BoxFit.contain,
                                alignment: Alignment.topRight,
                                image: AssetImage(
                                    "images/recipes/ree.jpeg"),
                              ),),
                          ),
                        ],)
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/r6'),
                        child: Material(
                        color: Colors.white,
                        elevation: 14.0,
                        borderRadius: BorderRadius.circular(24.0),
                        shadowColor: Color(0x802196F3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: myDetailsContainer6(),
                              ),
                            ),

                            Container(
                              width: 250,
                              height: 180,
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(24.0),
                                  child: Image(
                                    fit: BoxFit.contain,
                                    alignment: Alignment.topRight,
                                    image: AssetImage(
                                        "images/recipes/nutty-chicken-sate-strips.jpg"),
                                ),),
                            ),
                          ],)
                    ),
                  ),
                ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(

                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/r7'),
                  child: Material(
                      color: Colors.white,
                      elevation: 14.0,
                      borderRadius: BorderRadius.circular(24.0),
                      shadowColor: Color(0x802196F3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: myDetailsContainer7(),
                            ),
                          ),

                          Container(
                              width: 250,
                              height: 180,
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(24.0),
                                child: Image(
                                  fit: BoxFit.contain,
                                  alignment: Alignment.topRight,
                                  image: NetworkImage('https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/11/4/1/CCHAP402_Sloppy-Joes_s4x3.jpg.rend.hgtvcom.966.725.suffix/1382540648899.jpeg'),
                                ),
                              )
                          ),
                        ],)
                  ),
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }

  Widget myDetailsContainer1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(child: Text("Chicken satay salad",
            style: TextStyle(color: Colors.blueAccent,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(child: Text("5.0",
                    style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
                  Container(child: Icon(
                    FontAwesomeIcons.solidStar, color: Colors.amber,
                    size: 15.0,),),
                  Container(child: Icon(
                    FontAwesomeIcons.solidStar, color: Colors.amber,
                    size: 15.0,),),
                  Container(child: Icon(
                    FontAwesomeIcons.solidStar, color: Colors.amber,
                    size: 15.0,),),
                  Container(child: Icon(
                    FontAwesomeIcons.solidStar, color: Colors.amber,
                    size: 15.0,),),
                  Container(child: Icon(
                    FontAwesomeIcons.solidStar, color: Colors.amber,
                    size: 15.0,),),
                  Container(child: Text(" (89)",
                    style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
                ],)),
        ),
        Container(child: Text("Sara Buenfeld",
          style: TextStyle(color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),)),
      ],
    );
  }

  Widget myDetailsContainer2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(child: Text("Beef Stir-Fry ",
            style: TextStyle(color: Colors.blueAccent,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(child: Row(children: <Widget>[
            Container(child: Text("5.0",
              style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
            Container(child: Icon(
              FontAwesomeIcons.solidStar, color: Colors.amber, size: 15.0,),),
            Container(child: Icon(
              FontAwesomeIcons.solidStar, color: Colors.amber, size: 15.0,),),
            Container(child: Icon(
              FontAwesomeIcons.solidStar, color: Colors.amber, size: 15.0,),),
            Container(child: Icon(
              FontAwesomeIcons.solidStar, color: Colors.amber, size: 15.0,),),
            Container(child: Icon(
              FontAwesomeIcons.solidStar, color: Colors.amber,
              size: 15.0,),),
            Container(child: Text("(7)",
              style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
          ],)),
        ),
        Container(child: Text("Trisha Yearwood",
          style: TextStyle(color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }

  Widget myDetailsContainer3() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(child: Text("Lemony Yogurt Pound Cake",
            style: TextStyle(color: Colors.blueAccent,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(child: Row(children: <Widget>[
            Container(child: Text("3.4",
              style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
            Container(child: Icon(
              FontAwesomeIcons.solidStar, color: Colors.amber, size: 15.0,),),
            Container(child: Icon(
              FontAwesomeIcons.solidStar, color: Colors.amber, size: 15.0,),),
            Container(child: Icon(
              FontAwesomeIcons.solidStar, color: Colors.amber, size: 15.0,),),
            Container(child: Icon(
              FontAwesomeIcons.solidStarHalf, color: Colors.amber, size: 15.0,),),

            Container(child: Text("(15)",
              style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),

          ],)),
        ),
      ],
    );
  }

  Widget myDetailsContainer4() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(child: Text("Herbed Chicken Marsala",
            style: TextStyle(color: Colors.blueAccent,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(child: Row(children: <Widget>[
            Container(child: Text("4.7", style: TextStyle(
              color: Colors.black54, fontSize: 18.0,),)),
            Container(child: Icon(
              FontAwesomeIcons.solidStar, color: Colors.amber, size: 15.0,),),
            Container(child: Icon(
              FontAwesomeIcons.solidStar, color: Colors.amber, size: 15.0,),),
            Container(child: Icon(
              FontAwesomeIcons.solidStar, color: Colors.amber, size: 15.0,),),
            Container(child: Icon(
              FontAwesomeIcons.solidStar, color: Colors.amber,
              size: 15.0,),),
            Container(child: Text("(28)",
              style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
          ],)),
        ),
        Container(child: Text("Cassie Best",
          style: TextStyle(color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),)),
      ],
    );
  }

  Widget myDetailsContainer5() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(child: Text("Ree's Shrimp Stir-Fry",
            style: TextStyle(color: Colors.blueAccent,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(child: Row(children: <Widget>[
            Container(child: Text("5.0", style: TextStyle(
              color: Colors.black54, fontSize: 18.0,),)),
            Container(child: Icon(
              FontAwesomeIcons.solidStar, color: Colors.amber, size: 15.0,),),
            Container(child: Icon(
              FontAwesomeIcons.solidStar, color: Colors.amber, size: 15.0,),),
            Container(child: Icon(
              FontAwesomeIcons.solidStar, color: Colors.amber, size: 15.0,),),
            Container(child: Icon(
              FontAwesomeIcons.solidStar, color: Colors.amber,
              size: 15.0,),),
            Container(child: Icon(
              FontAwesomeIcons.solidStar, color: Colors.amber,
              size: 15.0,),),
            Container(child: Text("(1008)",
              style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
          ],)),
        ),
        Container(child: Text("Ree Drummond",
          style: TextStyle(color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),)),
      ],
    );
  }
}
Widget myDetailsContainer6() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(child: Text("Nutty chicken satay strips",
          style: TextStyle(color: Colors.blueAccent,
              fontSize: 24.0,
              fontWeight: FontWeight.bold),)),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(child: Row(children: <Widget>[
          Container(child: Text("5.0", style: TextStyle(
            color: Colors.black54, fontSize: 18.0,),)),
          Container(child: Icon(
            FontAwesomeIcons.solidStar, color: Colors.amber, size: 15.0,),),
          Container(child: Icon(
            FontAwesomeIcons.solidStar, color: Colors.amber, size: 15.0,),),
          Container(child: Icon(
            FontAwesomeIcons.solidStar, color: Colors.amber, size: 15.0,),),
          Container(child: Icon(
            FontAwesomeIcons.solidStar, color: Colors.amber,
            size: 15.0,),),
          Container(child: Icon(
            FontAwesomeIcons.solidStar, color: Colors.amber,
            size: 15.0,),),
          Container(child: Text("(89)",
            style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
        ],)),
      ),
      Container(child: Text("Sara Buenfeld",
        style: TextStyle(color: Colors.black54,
            fontSize: 18.0,
            fontWeight: FontWeight.bold),)),
    ],
  );
}
Widget myDetailsContainer7() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(child: Text("Sloppy Joes",
          style: TextStyle(color: Colors.blueAccent,
              fontSize: 24.0,
              fontWeight: FontWeight.bold),)),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(child: Text("5.0",
                  style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
                Container(child: Icon(
                  FontAwesomeIcons.solidStar, color: Colors.amber,
                  size: 15.0,),),
                Container(child: Icon(
                  FontAwesomeIcons.solidStar, color: Colors.amber,
                  size: 15.0,),),
                Container(child: Icon(
                  FontAwesomeIcons.solidStar, color: Colors.amber,
                  size: 15.0,),),
                Container(child: Icon(
                  FontAwesomeIcons.solidStar, color: Colors.amber,
                  size: 15.0,),),
                Container(child: Icon(
                  FontAwesomeIcons.solidStar, color: Colors.amber,
                  size: 15.0,),),
                Container(child: Text(" (89)",
                  style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
              ],)),
      ),
      Container(child: Text("Ellie Krieger",
        style: TextStyle(color: Colors.black54,
            fontSize: 18.0,
            fontWeight: FontWeight.bold),)),
    ],
  );
}
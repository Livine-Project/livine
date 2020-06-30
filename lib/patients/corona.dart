import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Corona extends StatefulWidget {

  @override
  _CoronaState createState() => _CoronaState();
}

class _CoronaState extends State<Corona> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text('Corona'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          new Container(
            child: Card(
              elevation: 10.0,
              child: Column(
                children:[
                  Image.network(
                    'https://edge.bonnieplants.com/www/uploads/20180920004011/red-bell-pepper.jpg',
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 200.0,
                    ),
                    SizedBox(height: 5.0),

                    Padding(
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "Red bell peppers",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green[600],
                          fontSize: 20.0,
                        ),
                      ),
                      ),
                    
                                       
                ],
                
                
              ),
            
            ),
          ),
            new Container(
            child: Card(
              elevation: 10.0,
              child: Column(
                children:[
                  Image.network(
                    'https://static.independent.co.uk/s3fs-public/thumbnails/image/2020/05/20/19/istock-1143163513.jpg?w968h681',
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 200.0,
                    ),
                    SizedBox(height: 5.0),

                    Padding(
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "Strawberries",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green[600],
                          fontSize: 20.0,
                        ),
                      ),
                      ),                                     
                ],      
              ),
            ),
          ),
            new Container(
            child: Card(
              elevation: 10.0,
              child: Column(
                children:[
                  Image.network(
                    'https://www.jessicagavin.com/wp-content/uploads/2019/09/types-of-garlic-1-1200.jpg',
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 200.0,
                    ),
                    SizedBox(height: 5.0),

                    Padding(
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "Garlic",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green[600],
                          fontSize: 20.0,
                        ),
                      ),
                      ),                                     
                ],      
              ),
            ),
          ),
                      new Container(
            child: Card(
              elevation: 10.0,
              child: Column(
                children:[
                  Image.network(
                    'https://www.seriouseats.com/2019/06/20190614-yogurt-vicky-wasik-8-1500x1125.jpg',
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 200.0,
                    ),
                    SizedBox(height: 5.0),

                    Padding(
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "Yogurt",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green[600],
                          fontSize: 20.0,
                        ),
                      ),
                      ),                                     
                ],      
              ),
            ),
          ),
                      new Container(
            child: Card(
              elevation: 10.0,
              child: Column(
                children:[
                  Image.network(
                    'https://i.ytimg.com/vi/zoUz8d_e-Ww/maxresdefault.jpg',
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 200.0,
                    ),
                    SizedBox(height: 5.0),

                    Padding(
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "Chickpeas",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green[600],
                          fontSize: 20.0,
                        ),
                      ),
                      ),                                     
                ],      
              ),
            ),
          ),
                      new Container(
            child: Card(
              elevation: 10.0,
              child: Column(
                children:[
                  Image.network(
                    'https://snaped.fns.usda.gov/sites/default/files/styles/crop_ratio_7_5/public/seasonal-produce/2018-05/mushrooms.jpg?h=b754914e&itok=Kldbq8Du',
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 200.0,
                    ),
                    SizedBox(height: 5.0),

                    Padding(
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "Mushrooms",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green[600],
                          fontSize: 20.0,
                        ),
                      ),
                      ),                                     
                ],      
              ),
            ),
          ),
                   new Container(
            child: Card(
              elevation: 10.0,
              child: Column(
                children:[
                  Image.network(
                    'https://www.jessicagavin.com/wp-content/uploads/2019/05/how-to-cook-broccoli-20-1200.jpg',
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 200.0,
                    ),
                    SizedBox(height: 5.0),

                    Padding(
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "Broccoli",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green[600],
                          fontSize: 20.0,
                        ),
                      ),
                      ),                                     
                ],      
              ),
            ),
          ),
                   new Container(
            child: Card(
              elevation: 10.0,
              child: Column(
                children:[
                  Image.network(
                    'https://sc01.alicdn.com/kf/HTB1HCEMq5OYBuNjSsD4q6zSkFXaF.jpg_350x350.jpg',
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 200.0,
                    ),
                    SizedBox(height: 5.0),

                    Padding(
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "Sunflower seeds",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green[600],
                          fontSize: 20.0,
                        ),
                      ),
                      ),                                     
                ],      
              ),
            ),
          ),
        ],
        ),
    );
  }
}

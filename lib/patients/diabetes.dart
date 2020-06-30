import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Diabetes extends StatefulWidget {

  @override
  _DiabetesState createState() => _DiabetesState();
}

class _DiabetesState extends State<Diabetes> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[600],
        title: Text('Diabetes'),
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
                    'https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/articles/health_tools/fatty_fish_that_are_high_in_omega_3s_slideshow/493ss_thinkstock_rf_atlantic_mackerel.jpg',
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 200.0,
                    ),
                    SizedBox(height: 5.0),

                    Padding(
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "Fatty Fish",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.pink[600],
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
                    'https://miro.medium.com/max/7160/0*Qg-sACv60IYe7Iav.jpg',
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 200.0,
                    ),
                    SizedBox(height: 5.0),

                    Padding(
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "Leafy Greens",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.pink[600],
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
                    'https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/scoop-of-cinnamon-1296x728.jpg?w=1155&h=1528',
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 200.0,
                    ),
                    SizedBox(height: 5.0),

                    Padding(
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "Cinnamon",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.pink[600],
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
                    'https://www.simplyrecipes.com/wp-content/uploads/2014/07/hard-boiled-eggs-horiz-800.jpg',
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 200.0,
                    ),
                    SizedBox(height: 5.0),

                    Padding(
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "Eggs",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.pink[600],
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
                    'https://5.imimg.com/data5/WD/HY/MY-4195389/chia-seeds-500x500.jpg',
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 200.0,
                    ),
                    SizedBox(height: 5.0),

                    Padding(
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "Chia Seeds",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.pink[600],
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
                    'https://i0.wp.com/cdn-prod.medicalnewstoday.com/content/images/articles/327/327455/turmeric-root-and-powder.jpg?w=1155&h=1675',
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 200.0,
                    ),
                    SizedBox(height: 5.0),

                    Padding(
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "Turmeric",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.pink[600],
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
                          color: Colors.pink[600],
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
                    'https://images-na.ssl-images-amazon.com/images/I/71QAe7Xq-yL._SL1117_.jpg',
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 200.0,
                    ),
                    SizedBox(height: 5.0),

                    Padding(
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "Nuts",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.pink[600],
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

import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Flu extends StatefulWidget {

  @override
  _FluState createState() => _FluState();
}

class _FluState extends State<Flu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: Text('Flu'),
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
                    'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2019/9/10/0/FNK_Chicken-Broth_H_s4x3.jpg.rend.hgtvcom.826.620.suffix/1568395014401.jpeg',
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 200.0,
                    ),
                    SizedBox(height: 5.0),

                    Padding(
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "Broth",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[900],
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
                    'https://i.ytimg.com/vi/o91gT73mQhg/maxresdefault.jpg',
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 200.0,
                    ),
                    SizedBox(height: 5.0),

                    Padding(
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "Chicken Soup",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[900],
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
                          color: Colors.purple[900],
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
                          color: Colors.purple[900],
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
                    'https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/slideshows/foods_with_vitamin_c_besides_oranges_slideshow/1800x1200_foods_with_vitamin_c_besides_oranges_slideshow.jpg',
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 200.0,
                    ),
                    SizedBox(height: 5.0),

                    Padding(
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "Vit. C Fruits",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[900],
                          fontSize: 15.0,
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
                        "Leafy greens",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[900],
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
                          color: Colors.purple[900],
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
                    'https://www.eatingbirdfood.com/wp-content/uploads/2019/04/egg-white-protein-oatmeal-4.jpg',
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 200.0,
                    ),
                    SizedBox(height: 5.0),

                    Padding(
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "Oatmeal",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[900],
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

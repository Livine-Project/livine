import 'package:app/Others/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SixRecipe extends StatefulWidget {
  @override
  _SixRecipeState createState() => _SixRecipeState();
}

class _SixRecipeState extends State<SixRecipe> {

  final String image = "images/recipes/nutty-chicken-sate-strips.jpg";
  var favIcon = Icon(Icons.favorite_border);

void btnToggle(){
  if (favIcon != Icon(Icons.favorite)) {
    favIcon = Icon(Icons.favorite);
  } else if(favIcon == Icon(Icons.favorite)) {
    favIcon = Icon(Icons.favorite_border);
  }
}
  _video() async {
    const url = 'https://www.youtube.com/watch?v=zWQ4AQ4diLo';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    // final theme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              foregroundDecoration: BoxDecoration(
                  color: Colors.black26
              ),
              height: 400,
              child: Image.asset(image, fit: BoxFit.cover)),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0,bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:16.0),
                  child: Text(
                    "Chicken Satay Salad",
                    style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 16.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text(
                        "90 reviews",
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      color: Colors.white,
                      icon: favIcon,
                      onPressed: () {
                        setState(() {
                           btnToggle();
                        });
                      },
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(32.0),
                  // color: (theme.getTheme() == ThemeData.dark() ) ? Colors.grey[900] : Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          child: Text("Video", style: TextStyle(
                              fontWeight: FontWeight.normal
                          ),),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 32.0,
                          ),
                          onPressed: _video,
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Text("Ingredients".toUpperCase(), style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0
                      ),),
                      const SizedBox(height: 10.0),
                      Text(
                        """
2 tbsp chunky peanut butter (without palm oil or sugar)
1 garlic clove, finely grated
1 tsp Madras curry powder
few shakes soy sauce
2 tsp lime juice
2 skinless, chicken breast fillets (about 300g) cut into thick strips
about 10cm cucumber, cut into fingers
sweet chilli sauce to serve 
    """,
                        textAlign: TextAlign.justify, style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0
                      ),),
                      const SizedBox(height: 10.0),
                      Text("Method".toUpperCase(), style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0
                      ),),
                      Text(
                        """
1. Heat oven to 200C, 180C fan, gas 4 and line a baking tray with non-stick paper.

2. Mix the peanut butter with the garlic, curry powder, soy sauce and lime in a bowl. Some nut butters are thicker than others, so if necessary, add a dash of boiling water to get a coating consistency. Add the chicken strips, mix well then arrange on the baking sheet, spaced apart, and bake in the oven for 8-10 mins until cooked, but still juicy.

3. Eat warm with the cucumber sticks and chilli sauce, or leave to cool then keep in the fridge for up to 2 days.
                        """
                        , textAlign: TextAlign.justify, style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0
                      ),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text("DETAIL",style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal
              ),),
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:app/Others/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class FourRecipe extends StatefulWidget {

  @override
  _FourRecipeState createState() => _FourRecipeState();
}

class _FourRecipeState extends State<FourRecipe> {

  final String image = "images/recipes/beef.jpeg";
  var favIcon = Icon(Icons.favorite_border);

  void btnToggle(){
    if (favIcon != Icon(Icons.favorite)) {
      favIcon = Icon(Icons.favorite);
    } else if(favIcon == Icon(Icons.favorite)) {
      favIcon = Icon(Icons.favorite_border);
    }
  }
  _video() async {
    const url = 'https://www.youtube.com/watch?v=cyS8ycmGs1U';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

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
                    "Beef Stir-Fry",
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
                        "15 reviews",
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
                  color: (theme.getTheme() == ThemeData.dark() ) ? Colors.grey[900] : Colors.white,
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
                                      Icons.star_half,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star_border,
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
Nonstick baking spray, for coating loaf pan

1 1/2 cups white whole wheat flour

2 teaspoons baking powder

1/4 teaspoon fine salt

3/4 cup sugar

Finely grated zest of 1 lemon

1/2 cup plain lowfat (2-percent) Greek yogurt

1/4 cup lowfat (1-percent) milk

1/4 cup extra-virgin olive oil

1/2 teaspoon pure vanilla extract

2 large egg whites

1 large egg

 
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
Preheat the oven to 350 degrees F. Coat an 8 1/2- by 4 1/2-inch loaf pan with baking spray. Whisk together the flour, baking powder and salt in a medium bowl. Put the sugar and lemon zest in another bowl and rub the lemon zest into the sugar with your fingers. Add the yogurt, milk, olive oil, vanilla, egg whites and whole egg and vigorously whisk until well blended. Add the flour mixture into the egg mixture and fold until just incorporated. Transfer to the prepared pan. Bake until a cake tester inserted in the center comes out clean, about 50 minutes. Cool in the pan on a wire rack for 5 minutes, and then unmold and cool to room temperature. 




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


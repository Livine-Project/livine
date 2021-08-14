import 'package:app/Others/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NineRecipe extends StatefulWidget {
  @override
  _NineRecipeState createState() => _NineRecipeState();
}

class _NineRecipeState extends State<NineRecipe> {

  final String image = "images/recipes/chiken.jpg";
  var favIcon = Icon(Icons.favorite_border);

  void btnToggle(){
    if (favIcon != Icon(Icons.favorite)) {
      favIcon = Icon(Icons.favorite);
    } else if(favIcon == Icon(Icons.favorite)) {
      favIcon = Icon(Icons.favorite_border);
    }
  }
  _video() async {
    const url = 'https://www.youtube.com/watch?v=UzUqoLe4At0';
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
                        "255 reviews",
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
1 pound extra-lean ground beef

1 onion, diced

4 cloves garlic, minced

1 jalapeno, minced

1 red pepper, diced

1 can small red beans or pinto beans, preferably low sodium drained and rinsed

1 1/2 cups no-salt-added tomato sauce

2 tablespoons tomato paste

1 tablespoon red wine vinegar

1 tablespoon molasses

1 tablespoon Worcestershire sauce

1 teaspoon mustard powder

3/4 teaspoon salt

Freshly ground black pepper

8 whole-wheat burger buns

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
1. Brown the meat and the onion in a large nonstick skillet over medium-high heat for 5 minutes, 
2. breaking up the meat into crumbles as it cooks. Pour the drippings out of the pan and discard. 
3. Add the garlic, jalapeno, and red pepper and cook 5 minutes more, stirring occasionally. 
4. Stir in the rest of the ingredients, reduce heat to low, and simmer for 5 minutes more. 
5. Place a half-cup scoop of the mixture onto each bun and serve.

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


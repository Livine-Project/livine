import 'package:app/Others/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class FiveRecipe extends StatefulWidget {

  @override
  _FiveRecipeState createState() => _FiveRecipeState();
}

class _FiveRecipeState extends State<FiveRecipe> {

  final String image = "images/recipes/ree.jpeg";
  var favIcon = Icon(Icons.favorite_border);

  void btnToggle(){
    if (favIcon != Icon(Icons.favorite)) {
      favIcon = Icon(Icons.favorite);
    } else if(favIcon == Icon(Icons.favorite)) {
      favIcon = Icon(Icons.favorite_border);
    }
  }
  _video() async {
    const url = 'https://www.youtube.com/watch?v=fx_FljxGU58';
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
                    "Ree's Shrimp Stir-Fry",
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
1 tablespoon butter

1 tablespoon olive oil 

2 pounds jumbo shrimp, peeled and deveined, tails on 

4 cloves garlic, minced 

2 large zucchini, diced 

2 large ears of corn, kernels removed 

3/4 cup red grape tomatoes, sliced in half lengthwise 

3/4 cup yellow grape tomatoes, sliced in half lengthwise 

Salt and freshly ground black pepper

12 to 18 fresh basil leaves, cut in chiffonade 

Parmesan shavings 

Juice of 1 lemon 

Rice or pasta, for serving, optional
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
1. Melt the butter with the olive oil in a large skillet over a medium-high heat. Add the shrimp and garlic, then saute until the shrimp are opaque, about 3 minutes. Remove the shrimp to a plate.

2. Increase the heat to high, then throw in the zucchini. Stir it around for about 45 seconds, then scoot the zucchini to the edges of the pan. Throw in the corn and cook it for a minute, then push it to the edges of the pan. Throw in the grape tomatoes, stir them around for a minute, then sprinkle on some salt and pepper to taste.

3. Then throw the shrimp back in. Stir everything around for about 45 seconds, or until it's all combined and hot. Then pour it onto a big platter.

4. Sprinkle on the fresh basil and some Parmesan shavings then ... this is the best part ... squeeze the lemon all over the top. This adds a wonderful, indescribable freshness.

5. You can serve this with rice, with pasta or it's just perfect on its own.
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


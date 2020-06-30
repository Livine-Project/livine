import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondRecipe extends StatefulWidget {
  static final String path = "lib/src/pages/hotel/details.dart";

  @override
  _SecondRecipeState createState() => _SecondRecipeState();
}

class _SecondRecipeState extends State<SecondRecipe> {

  final String image = "images/marsala.jpeg";
  var favIcon = Icon(Icons.favorite_border);

  void btnToggle(){
    if (favIcon != Icon(Icons.favorite)) {
      favIcon = Icon(Icons.favorite);
    } else if(favIcon == Icon(Icons.favorite)) {
      favIcon = Icon(Icons.favorite_border);
    }
  }
  _video() async {
    const url = 'https://www.youtube.com/watch?v=7jR8f96s5Pk';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
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
                    "Herbed Chicken Marsala",
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
                        "28 reviews",
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
                  color: Colors.white,
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
Four 4-ounce boneless, skinless chicken breast cutlets

Kosher salt and freshly ground black pepper

1/3 cup whole wheat flour

1 1/2 tablespoons extra-virgin olive oil

3/4 cup low-sodium chicken broth

1/3 cup sun-dried tomatoes (not packed in oil; not rehydrated), finely chopped or very thinly sliced

1/2 teaspoon finely chopped fresh rosemary

10 ounces white button or cremini (baby bella) mushrooms, sliced

1/3 cup sweet marsala wine

2 teaspoons unsalted butter

1 to 2 tablespoons roughly chopped fresh flat-leaf parsley
 
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
1. Place the chicken cutlets between 2 pieces of plastic wrap and pound with a meat mallet (or the flat side of a chef's knife) until about 1/3 inch thick. Sprinkle with 1/4 teaspoon salt and 1/4 teaspoon pepper.

2. Put the flour on a medium plate. Heat the oil in a large nonstick skillet over medium-high heat. Dredge the chicken in the flour to fully coat, shaking off any excess. Add the chicken to the skillet and fry until fully cooked and golden brown, about 4 minutes per side. Transfer to a platter and tent with foil to keep warm.

3. Add 1/2 cup of the broth, the sun-dried tomatoes and rosemary to any remaining drippings in the skillet and cook, stirring frequently, for 1 minute to plump the tomatoes. Add the mushrooms, 1/4 teaspoon salt and 1/2 teaspoon pepper and cook until the mushrooms are soft, about 5 minutes. Add the marsala and bring to a boil. Add the remaining 1/4 cup broth and the butter and simmer until the butter is fully melted, about 30 seconds.

4. Spoon the mushroom mixture and sauce over the chicken, sprinkle with the parsley and serve.


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


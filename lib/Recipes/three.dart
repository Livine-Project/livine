import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ThirdRecipe extends StatefulWidget {

  @override
  _ThirdRecipeState createState() => _ThirdRecipeState();
}

class _ThirdRecipeState extends State<ThirdRecipe> {

  final String image = "images/yogurt-cake.jpeg";
  var fav_icon = Icon(Icons.favorite_border);

  void Toggle(){
    if (fav_icon != Icon(Icons.favorite)) {
      fav_icon = Icon(Icons.favorite);
    } else if(fav_icon == Icon(Icons.favorite)) {
      fav_icon = Icon(Icons.favorite_border);
    }
  }
  _video() async {
    const url = 'https://www.youtube.com/watch?v=NVtaOmhgAWM';
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
                    "Lemony Yogurt Pound Cake",
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
                      icon: fav_icon,
                      onPressed: () {
                        setState(() {
                          Toggle();
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


1 1/2 pounds skirt steak, cut into 4-inch-long pieces, then cut against the grain into 1/4-inch-thick slices

Salt and freshly ground pepper

1/4 cup low-sodium soy sauce

1 serrano chile pepper, seeded and finely chopped

2 teaspoons sugar

2 tablespoons freshly squeezed lime juice (1 to 2 limes)

2 tablespoons olive oil

2 cloves garlic, grated

1 bunch scallions, thinly sliced

6 ounces fresh mushrooms, sliced

1/4 pound snow peas or green beans

1 12-ounce can baby corn, drained

1 red bell pepper, thinly sliced (optional)

 
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
1. Season the steak with salt and pepper. In a medium bowl, whisk together the soy sauce, chile pepper, sugar and lime juice until the sugar is dissolved. Add the beef, toss to coat and set aside.
2. In a large skillet over medium-high heat, heat the oil until shimmering, about 1 minute. Add the beef and cook, stirring, until cooked through, 3 to 5 minutes.
3. Remove the beef from the skillet and set aside. Allow the liquid in the pan to reduce until thickened, about 4 minutes. Add the garlic and scallions and cook 1 minute more. Add the mushrooms and cook for 2 to 3 minutes more. Add the snow peas, baby corn and bell pepper and continue cooking until all the vegetables are crisp-tender, about 2 minutes. Return the beef to the skillet and toss to combine.
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


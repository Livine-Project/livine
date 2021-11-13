import 'package:app/Others/loading.dart';
import 'package:app/recipe/recipe.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          ImageAndIcons(size: size),
          FoodTitle(
            name: 'Salad',
            type: 'Covid',
          ),
          
          Row(
            children: [
              SizedBox(
                width: size.width/2,
                height: 84,
                child: TextButton(
                  
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xfff3F37C9),
                    
                    ),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight:Radius.circular(30.0))))
                  ),
                  onPressed: (){},
                  child: Text("Video",style: TextStyle(color: Colors.white,fontSize: 16),),

                ),
              ),
                            SizedBox(
                width: size.width/2,
                height: 84,
                child: TextButton(
                  
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreenAccent,
                    
                    ),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft:Radius.circular(30.0))))
                  ),
                  onPressed: (){},
                  child: Text("Ingridents",style: TextStyle(color: Colors.black,fontSize: 16),),

                ),
              ),
                          ],
          ),
        ],
      ),
    );
  }
}

class FoodTitle extends StatelessWidget {
  const FoodTitle({
    Key key, this.name, this.type,
  }) : super(key: key);
final String name;
final String type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          RichText(
              text: TextSpan(children: [
            TextSpan(
              text: name,
              style: Theme.of(context).textTheme.headline4.copyWith(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: type,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.blueAccent[700],
                  fontSize: 20),
            ),
          ])),
        ],
      ),
    );
  }
}

class ImageAndIcons extends StatelessWidget {
  const ImageAndIcons({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.8,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          padding: EdgeInsets.only(
                              top: size.height * 0.1, left: 10.0),
                          icon: SvgPicture.asset('images/login/back_arrow.svg',
                              color: Colors.blueAccent),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      Spacer(),
                      IconCard(
                        image: 'images/recipes/calories.jpg',
                      ),
                      Text('1758'),
                      IconCard(
                        image: 'images/recipes/ingredients.png',
                      ),
                      IconCard(
                        image: 'images/recipes/ingredients.png',
                      ),
                      IconCard(
                        image: 'images/recipes/ingredients.png',
                      ),
                    ],
                  ),
                ),
                Consumer(
                  builder: (context,watch,child){
                  final recipesData = watch(recipesProvider);
                  return recipesData.when(
                    data: (data) => Container(
                    height: size.height * 0.8,
                    width: size.width * 0.75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(63),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 150,
                            color: Colors.blueAccent[700].withOpacity(0.29),
                          )
                        ],
                        image: DecorationImage(
                            alignment: Alignment.centerLeft,
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                                'https://livine.pythonanywhere.com/media/recipes/Salad.png'))),
                  ),
                  loading: () => Loading(),
                  error: (e, s) {
                    print('$e\n$s');
                    return Text(e.toString());
                  
                  },
                  );
                  }
                )
                  
                  // child: Container(
                  //   height: size.height * 0.8,
                  //   width: size.width * 0.75,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(63),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           offset: Offset(0, 10),
                  //           blurRadius: 150,
                  //           color: Colors.blueAccent[700].withOpacity(0.29),
                  //         )
                  //       ],
                  //       image: DecorationImage(
                  //           alignment: Alignment.centerLeft,
                  //           fit: BoxFit.cover,
                  //           image: CachedNetworkImageProvider(
                  //               'https://livine.pythonanywhere.com/media/recipes/Salad.png'))),
                  // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IconCard extends StatelessWidget {
  const IconCard({
    Key key,
    @required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
      padding: EdgeInsets.all(8),
      height: 52,
      width: 52,
      decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 22,
              color: Colors.blueAccent[700].withOpacity(0.22),
            ),
            BoxShadow(
                offset: Offset(-15, -15), blurRadius: 20, color: Colors.white),
          ]),
      child: Image.asset(
        image,
        color: Colors.white,
      ),
    );
  }
}

// ignore_for_file: use_full_hex_values_for_flutter_colors, avoid_print, type_annotate_public_apis

import 'package:go_router/go_router.dart';

import 'package:url_launcher/url_launcher.dart';

import '../Others/loading.dart';
import 'recipe.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({Key? key, required this.id}) : super(key: key);
  final id;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Consumer(
        builder: (context, ref, child) {
          final recipesData = ref.watch(recipesProviderID(
              id));
          return recipesData.when(
            data: (data) {
              _launchURL() async {
                var url = data.video;
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              }

              return Column(
                children: [
                  ImageAndIcons(size: size,id:id),
                  FoodTitle(
                    name: data.name,
                    type: data.type,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width / 2,
                        height: 84,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: 
                            Theme.of(context).brightness == Brightness.dark? MaterialStateProperty.all<Color>(Colors.blueGrey):MaterialStateProperty.all<Color>(
                              Color(0xfff3f37c9),
                            ),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30.0)))),
                          ),
                          onPressed: _launchURL,
                          child: Text(
                            "Video",
                            style: TextStyle(
                              color: Colors.white, 
                              fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width / 2,
                        height: 84,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: Theme.of(context).brightness == Brightness.dark?MaterialStateProperty.all<Color>(Colors.grey): MaterialStateProperty.all<Color>(
                              Colors.lightGreenAccent,
                            ),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30.0)))),
                          ),
                          onPressed: () =>
                                  context.push('/ingridents',extra: data.ingridents),
                          child: Text(
                            "Ingridents",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            error: (e, s) => Loading(),
            loading: () => Loading(),
          );
        },
      ),
    );
  }
}

class FoodTitle extends StatelessWidget {
  const FoodTitle({
    Key? key,
    this.name,
    this.type,
  }) : super(key: key);
  final String? name;
  final String? type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: name,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark? Colors.grey[400]:Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  TextSpan(
                    text: type,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).brightness == Brightness.dark? Colors.white :Colors.blueAccent[700],
                      fontSize: 20,
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

class ImageAndIcons extends StatelessWidget {
  const ImageAndIcons({
    Key? key,
    required this.size,
    required this.id,
  }) : super(key: key);

  final Size size;
  final id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.8,
            child: Consumer(
              builder: (context, ref, child) {
                final recipesData = ref.watch(recipesProviderID(
                    id));
                return recipesData.when(
                  data: (data) {
                    return Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: IconButton(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.1,
                                    left: 10.0,
                                  ),
                                  
                                  icon: SvgPicture.asset(
                                    'assets/images/login/back_arrow.svg',
                                    color: Theme.of(context).brightness == Brightness.dark? Colors.white : Colors.blueAccent,
                                  ),
                                  onPressed: () => context.pop(),
                                ),
                              ),
                              Spacer(),
                              IconCard(
                                image: 'assets/images/recipes/calories.jpg',
                              ),
                              Text("1789"),
                              IconCard(
                                image: 'assets/images/recipes/ingredients.png',
                              ),
                              IconCard(
                                image: 'assets/images/recipes/ingredients.png',
                              ),
                              IconCard(
                                image: 'assets/images/recipes/ingredients.png',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: size.height * 0.8,
                          width: size.width * 0.75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(63),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 100,
                                color:
                                    Theme.of(context).brightness == Brightness.dark? Colors.blueGrey[600]!.withOpacity(0.29):Colors.blueAccent[700]!.withOpacity(0.29),
                              )
                            ],
                            image: DecorationImage(
                              alignment: Alignment.centerLeft,
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                'https://livine.pythonanywhere.com/${data.imageURL}',
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  loading: () => Loading(),
                  error: (e, s) {
                    print('$e\n$s');
                    return Text(e.toString());
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class IconCard extends StatelessWidget {
  const IconCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
      padding: EdgeInsets.all(8),
      height: 52,
      width: 52,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark?Colors.grey[600]: Colors.blueAccent,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 22,
            color: Theme.of(context).brightness == Brightness.dark? Colors.grey[400]!.withOpacity(0.22):Colors.blueAccent[700]!.withOpacity(0.22),
          ),
          BoxShadow(
            offset: Offset(-15, -15),
            blurRadius: 20,
            color: Theme.of(context).brightness == Brightness.dark?Colors.transparent:  Colors.white,
          ),
        ],
      ),
      child: Image.asset(
        image,
        color: Colors.white,
      ),
    );
  }
}

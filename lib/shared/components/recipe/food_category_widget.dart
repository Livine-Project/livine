
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FoodCategory extends StatelessWidget {
  const FoodCategory({
    Key? key,
    required this.navigate,
    required this.image,
    required this.name,
    required this.color,
  }) : super(key: key);

  final String navigate;
  final String image;
  final String name;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(navigate),
      child: Container(

        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(imageUrl: image,height: 185,width: 400.0,fit: BoxFit.cover,),
                new SizedBox(height: 10.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),),
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}

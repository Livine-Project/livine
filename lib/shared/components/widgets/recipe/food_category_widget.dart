import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FoodCategory extends StatelessWidget {
  const FoodCategory({
    Key? key,
    required this.navigate,
    required this.image,
    required this.name,
  }) : super(key: key);

  final String navigate;
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: InkWell(
          onTap: () => context.push(navigate),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(10.0),
                        bottom: Radius.circular(15.0)),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      width: 320.0,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 10.0),
                  child: Text(
                    name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

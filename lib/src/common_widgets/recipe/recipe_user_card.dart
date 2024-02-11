import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RecipeUserCard extends StatelessWidget {
  const RecipeUserCard({
    super.key,
    required this.imageURL,
    required this.name,
    required this.onTap
  });

  final String imageURL, name;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10.0), bottom: Radius.circular(10.0)),
              child: CachedNetworkImage(
                imageUrl: imageURL,
                height: 140,
                errorWidget: (context, url, error) =>
                    const Icon(Icons.broken_image_outlined),
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontFamily: 'Kine', fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

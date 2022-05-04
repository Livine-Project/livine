import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Others/colors.dart';

class RecipeCardNormal extends StatefulWidget {
  const RecipeCardNormal({
    Key? key,
    required this.id,
    required this.name,
    required this.foodImage,
    required this.type,
    required this.rating,
  }) : super(key: key);

  final int id;
  final String name;
  final ImageProvider foodImage;
  final String type;
  final String rating;

  @override
  State<RecipeCardNormal> createState() => _RecipeCardNormalState();
}

class _RecipeCardNormalState extends State<RecipeCardNormal> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Material(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[800]
                // ignore: use_full_hex_values_for_flutter_colors
                : primaryColor,
            borderRadius: BorderRadius.circular(15.0),
            child: InkWell(
              splashColor: Colors.orange[600],
              onTap: () => context.push('/details', extra: widget.id),
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                padding: EdgeInsets.only(top: 5.0),
                height: 230.0,
                width: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: widget.foodImage,
                    scale: 5.0,
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Container(
                        width: 100,
                        child: Text(
                          '${widget.name}',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Kine',
                            fontSize: 17.0,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(
                        '${widget.type}',
                        style: TextStyle(
                          fontFamily: 'Kine',
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //TODO: Like Button
                          // Container(
                          //   padding: EdgeInsets.only(left: 5.0),
                          //   height: 320.0,
                          //   width: 70.0,
                          //   child: GestureDetector(
                          //     child: LikeButton(
                          //       likeBuilder: (isLiked) {
                          //         return Icon(
                          //           FontAwesomeIcons.solidHeart,
                          //           color: isLiked
                          //               ? Color(0xFF22577a)
                          //               : Colors.white,
                          //         );
                          //       },
                          //     ),
                          //   ),
                          // ),
                          Text(
                            '${widget.rating}',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
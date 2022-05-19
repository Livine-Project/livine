import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../styles/lib_color_schemes.g.dart';

class RecipeCardNormal extends StatefulWidget {
  const RecipeCardNormal({
    Key? key,
    required this.id,
    required this.name,
    required this.foodImage,
    required this.type,
    required this.time,
    required this.difficulty,
    required this.dImage,
  }) : super(key: key);

  final int id;
  final String name;
  final ImageProvider foodImage;
  final String type;
  final String time;
  final String difficulty;
  final String dImage;

  @override
  State<RecipeCardNormal> createState() => _RecipeCardNormalState();
}

class _RecipeCardNormalState extends State<RecipeCardNormal> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Material(
              color: Theme.of(context).brightness == Brightness.dark
                  ? darkColorScheme.onSecondary
                  // ignore: use_full_hex_values_for_flutter_colors
                  : lightColorScheme.secondaryContainer,
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
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.clock,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  widget.time,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  widget.dImage,
                                  width: 20.0,
                                ),
                                SizedBox(
                                  width: 2.0,
                                ),
                                Text(
                                  widget.difficulty,
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  const IconCard(
      {Key? key,
      required this.image,
      required this.color,
      required this.name,
      this.takeColor = false,
      this.calAmount})
      : super(key: key);

  final String image;
  final Color color;
  final bool takeColor;
  final String name;

  final String? calAmount;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
      padding: const EdgeInsets.all(8),
      height: 120,
      width: 90,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            image,
            width: 60,
          ),
          if (calAmount != null) Text(calAmount.toString()),
          FittedBox(
            child: Text(
              name,
              style: const TextStyle(fontSize: 13.0),
            ),
          )
        ],
      ),
    );
  }
}

class IngridentsW extends StatelessWidget {
  const IngridentsW({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          alignment: Alignment.topCenter,
          decoration:
              BoxDecoration(color: theme.primary, shape: BoxShape.circle),
        ),
        const SizedBox(
          width: 15.0,
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 17.0),
          ),
        ),
      ],
    );
  }
}

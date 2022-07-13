import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:livine/shared/constants/constants.dart';
import 'package:livine/shared/controllers/cache/cache_helper.dart';
import 'package:percent_indicator/percent_indicator.dart';

final amountProvider = StateProvider<int>((ref) => 0);

class GlassWater extends StatelessWidget {
  const GlassWater({Key? key, required this.data}) : super(key: key);
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const Center(
              child: Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Text(
              'Current Hydration',
              style: TextStyle(fontSize: 20, fontFamily: 'Kine'),
            ),
          )),
          const SizedBox(height: 50),
          CircularPercentIndicator(
            radius: 100.0,
            lineWidth: 13.0,
            animation: true,
            percent: data["rate"] / 100,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${data["rate"].round()} %",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                      fontFamily: 'Kine'),
                ),
                Text(
                  data["current"].toString(),
                  style: const TextStyle(fontSize: 16.0, fontFamily: 'Kine'),
                ),
                Text(
                  "- ${data["remains"]} ml",
                  style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Kine',
                      color: theme.tertiary.withOpacity(0.5)),
                ),
              ],
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: theme.tertiaryContainer,
          ),
          const SizedBox(height: 50),
          Expanded(
            child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                childAspectRatio: 8 / 4,
                mainAxisSpacing: 10,
                children: [
                  GlassCubes(
                    theme: theme,
                    color: theme.tertiaryContainer,
                    text: "250 ml",
                    onColor: theme.onTertiaryContainer,
                    image: Icons.water_drop,
                    amount: 250,
                  ),
                  GlassCubes(
                    theme: theme,
                    color: theme.tertiaryContainer,
                    text: "500 ml",
                    onColor: theme.onTertiaryContainer,
                    image: FontAwesomeIcons.bottleWater,
                    amount: 500,
                  ),
                  GlassCubes(
                    theme: theme,
                    color: theme.tertiaryContainer,
                    text: "180 ml",
                    onColor: theme.onTertiaryContainer,
                    image: FontAwesomeIcons.glassWater,
                    amount: 180,
                  ),
                  GlassCubes(
                    theme: theme,
                    color: theme.tertiaryContainer,
                    text: "250 ml",
                    onColor: theme.onTertiaryContainer,
                    image: Icons.water_drop,
                    amount: 250,
                  ),
                ]),
          )
        ],
      ),
    );
  }
}

class GlassCubes extends ConsumerStatefulWidget {
  const GlassCubes({
    Key? key,
    required this.theme,
    required this.text,
    required this.color,
    required this.image,
    required this.onColor,
    required this.amount,
  }) : super(key: key);

  final ColorScheme theme;
  final String text;
  final Color color, onColor;
  final IconData image; //CHange later
  final int amount;

  @override
  ConsumerState<GlassCubes> createState() => _GlassCubesState();
}

class _GlassCubesState extends ConsumerState<GlassCubes> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton.icon(
        label: Text(
          widget.text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: widget.onColor,
              fontSize: 17.0),
        ),
        onPressed: () {
          CacheHelper.setInt("increaseAmount", widget.amount);
          ref.read(amountProvider.notifier).update((state) => widget.amount);
          hydrationControl.resetonFull(setState);
        },
        style: ElevatedButton.styleFrom(
            primary: widget.color,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        icon: Icon(
          widget.image,
          color: widget.onColor,
        ),
      ),
    );
  }
}

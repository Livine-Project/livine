import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../translations/domain/translation_provider.dart';
import '../data/cooking_data.dart';

class Cooking extends HookConsumerWidget {
  final dynamic data;
  const Cooking({
    super.key,
    required this.data,
  });

  final int endTimerinSeconds = 5;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = useState(0);
    final isPaused = useState(false);
    final startTimer = useState(0.0);
    final isPlaying = useAnimationController(
        duration: const Duration(seconds: 1), initialValue: 0.0);
    final pageController = usePageController();
    print(startTimer.value);
    final directions = data["directions"];
    final video = data["video"];

    useEffect(
      () {
        if (isPaused.value) {
          startTimer.value = startTimer.value;
          isPlaying.reverse();
        } else {
          Future.delayed(Duration(seconds: 1), () async {
            if (isPaused.value) {
              startTimer.value = startTimer.value;
              isPlaying.reverse();
            }
            if (startTimer.value == endTimerinSeconds.toDouble() &&
                index.value == directions.length - 1 &&
                !isPaused.value) {
              print("add points");
              addPoints(ref: ref, points: 10).then((value) {
                isPaused.value = true;
                startTimer.value = 0.0;
              });
            }
            if (startTimer.value < endTimerinSeconds) {
              startTimer.value += 1;
              isPlaying.forward();
            } else {
              if (index.value < directions.length - 1) {
                isPaused.value = true;
                startTimer.value = 0.0;
                pageController.animateToPage(index.value + 1,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInCirc);
                isPlaying.reverse();
              }
            }
          });
        }
        return null;
      },
    );
    return Scaffold(
        body: PageView.builder(
            onPageChanged: (value) {
              isPaused.value = true;
              startTimer.value = 0;
              index.value = value;
              isPlaying.reverse();
            },
            itemCount: directions.length,
            controller: pageController,
            itemBuilder: (context, _) {
              return DirectionsWidget(
                  index: index,
                  endTimerinSeconds: endTimerinSeconds,
                  directions: directions,
                  startTimer: startTimer,
                  isPaused: isPaused,
                  video: video,
                  isPlaying: isPlaying);
            }));
  }
}

class DirectionsWidget extends StatelessWidget {
  const DirectionsWidget({
    super.key,
    required this.index,
    required this.directions,
    required this.startTimer,
    required this.isPaused,
    required this.isPlaying,
    required this.endTimerinSeconds,
    required this.video,
  });

  final ValueNotifier<int> index;
  final List directions;
  final ValueNotifier<double> startTimer;
  final ValueNotifier<bool> isPaused;
  final AnimationController isPlaying;
  final int endTimerinSeconds;
  final String video;

  @override
  Widget build(BuildContext context) {
    int timeLeftSeconds = endTimerinSeconds - startTimer.value.toInt();
    int timeLeftMin = timeLeftSeconds ~/ 60;
    int timeLeftSec = timeLeftSeconds % 60;
    String timeleftSec = timeLeftSec < 10 ? "0$timeLeftSec" : "$timeLeftSec";
    final word = TranslationRepo.translate(context);

    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: Icon(Icons.arrow_back_outlined))),
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton.icon(
                  onPressed: () => context.pushNamed('recipeVideo',extra: video),
                  label: Text(word!.watch_video),
                  icon: Icon(Icons.play_arrow_outlined),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "${word.step} ${index.value + 1} ",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary)),
                  TextSpan(
                      text: "${word.step_of} ${directions.length}",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w100)),
                ]),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  " \"${directions[index.value]}\"",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.5)),
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              CircularPercentIndicator(
                radius: 80,
                center: Icon(
                  Icons.soup_kitchen_outlined,
                  size: 50,
                ),
                progressColor: Theme.of(context).colorScheme.primary,
                percent: startTimer.value / endTimerinSeconds,
                animation: true,
                lineWidth: 5,
                animateFromLastPercent: true,
                backgroundColor:
                    Theme.of(context).colorScheme.primary.withOpacity(0.1),
                circularStrokeCap: CircularStrokeCap.round,
                curve: Curves.easeIn,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text("0${timeLeftMin}:${timeleftSec}",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary)),
              const SizedBox(
                height: 60.0,
              ),
              CircleAvatar(
                  radius: 30,
                  child: IconButton(
                      onPressed: () {
                        isPaused.value = !isPaused.value;
                      },
                      selectedIcon: Icon(Icons.pause_outlined),
                      isSelected: !isPaused.value,
                      icon: AnimatedIcon(
                        progress: isPlaying,
                        icon: AnimatedIcons.play_pause,
                      ))),
              const SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

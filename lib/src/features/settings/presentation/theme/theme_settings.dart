import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livine/src/features/settings/presentation/theme/data/colors_type.dart';
import 'package:livine/src/shared/device_info/device_info.dart';

import '../../../../translations/domain/translation_provider.dart';
import '../../data/theme.dart';
import 'domain/theme_notifier.dart';

class ThemeSettings extends HookWidget {
  const ThemeSettings({Key? key}) : super(key: key);

  int getInitialSegment(ThemeMode themeMode) {
    if (themeMode == ThemeMode.light) {
      return 0;
    } else if (themeMode == ThemeMode.dark) {
      return 1;
    } else {
      return 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    final word = TranslationRepo.translate(context);
    List<Color> colors = [
      Color(0xFF4CAF50),
      Color(0xFF2196F3),
      Color(0xFF3F51B5),
      Color(0xFF9C27B0),
      Color(0xFFF44336),
      Color(0xFFFFC107),
    ];
    List<ColorTypes> colorTypes = [
      ColorTypes(
          type: word?.primary_color ?? "",
          color: Theme.of(context).colorScheme.primary,
          subtitle: word?.primary_color_hint ??
              "Primary color is used for the app bar and the selected tab indicator."),
      ColorTypes(
          type: word?.secondary_color ?? "",
          color: Theme.of(context).colorScheme.secondary,
          subtitle: word?.secondary_color_hint ??
              "Secondary color is used for the floating action button and the selected tab indicator."),
      ColorTypes(
          type: word?.tertiary_color ?? "",
          color: Theme.of(context).colorScheme.tertiary,
          subtitle: word?.teritary_color_hint ?? ""),
    ];

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar.large(
          title: Text(word?.theme ?? "Theme"),
        ),
        SliverToBoxAdapter(
          child: Consumer(
            builder: (context, ref, child) {
              final theme = ref.read(themeProvider).themeMode;
              return Center(
                child: CustomSlidingSegmentedControl(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  thumbDecoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  height: 55,
                  fixedWidth: 100,
                  padding: 25,
                  curve: Curves.easeInOut,
                  initialValue: getInitialSegment(theme),
                  children: {
                    0: Text(
                      word?.light ?? "Light",
                    ),
                    1: Text(
                      word?.dark ?? "Dark",
                    ),
                    2: Text(
                      word?.system ?? "System",
                    ),
                  },
                  onValueChanged: (value) {
                    if (value == 0) {
                      ref.read(themeProvider).setLight();
                    } else if (value == 1) {
                      ref.read(themeProvider).setDark();
                    } else {
                      ref.read(themeProvider).setSystem();
                    }
                  },
                ),
              );
            },
          ),
        ),
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Consumer(
            builder: (context, ref, child) {
              final isDynamic = ref.watch(dynamicThemeProvider);
              return SwitchListTile(
                title: Text(word?.dynamic_theme ?? ""),
                value: isDynamic == true,
                onChanged: !GetDeviceInfo.isAndroid12Above()
                    ? null
                    : (v) => ref
                        .watch(dynamicThemeProvider.notifier)
                        .toggleDynamic(v),
                subtitle: Text(word?.dynamic_theme_hint ?? ""),
                isThreeLine: true,
              );
            },
          ),
        )),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 100,
              child: ListView.separated(
                  itemCount: colors.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ThemeChoice(
                        color: colors[index],
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        width: 10,
                      )),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          childCount: colorTypes.length,
          (context, index) => Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: ListTile(
              title: Text(colorTypes[index].type),
              subtitle: Text(colorTypes[index].subtitle),
              trailing: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: colorTypes[index].color, shape: BoxShape.circle),
              ),
            ),
          ),
        )),
      ],
    ));
  }
}

class ThemeChoice extends StatelessWidget {
  const ThemeChoice({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        bool isSelected = color == ref.watch(themeSeedProvider);
        final isDynamic = ref.watch(dynamicThemeProvider);
        return Container(
          width: 100,
          decoration: BoxDecoration(
            color: isDynamic == true
                ? Theme.of(context).colorScheme.primary.withOpacity(0.5)
                : color.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: IconButton(
            splashRadius: 20.0,
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
            ),
            isSelected: isDynamic == true ? false : isSelected,
            selectedIcon:
                Icon(Icons.check_circle_rounded, color: color, size: 60),
            onPressed: isDynamic == true
                ? null
                : () {
                    ref.read(themeSeedProvider.notifier).setTheme(color);
                  },
            icon: Container(
              decoration: BoxDecoration(
                border: GradientBoxBorder(
                    gradient: LinearGradient(colors: [
                      isDynamic == true
                          ? Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5)
                          : color,
                      isDynamic == true
                          ? Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5)
                          : color.harmonizeWith(Colors.cyanAccent)
                    ]),
                    width: 15),
                borderRadius: BorderRadius.circular(100),
              ),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
        );
      },
    );
  }
}

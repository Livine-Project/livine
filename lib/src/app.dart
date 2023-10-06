import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../src/features/settings/presentation/theme/domain/theme_notifier.dart';
import 'features/settings/data/theme.dart';
import 'routing/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'translations/domain/translation_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialAppWithTheme();
  }
}

class MaterialAppWithTheme extends ConsumerWidget {
  const MaterialAppWithTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final router = baseRoutes;
    Color themeSeed = ref.watch(themeSeedProvider) as Color;
    bool isDynamic = ref.watch(dynamicThemeProvider) as bool;
    final localeNotifier = ref.watch(localeNotifierProvider);
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
          print(lightDynamic.toString());

          return MaterialApp.router(
            showPerformanceOverlay: kProfileMode == true,
            routeInformationProvider: router.routeInformationProvider,
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
            locale: localeNotifier,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: TranslationRepo.supportedLocales,
            debugShowCheckedModeBanner: false,
            builder: (context, child) => ResponsiveBreakpoints.builder(
              child: child!,
              breakpoints: [
                const Breakpoint(start: 0, end: 700, name: MOBILE),
                const Breakpoint(start: 700, end: 1280, name: TABLET),
                const Breakpoint(start: 1281, end: 1920, name: DESKTOP),
              ],
            ),
            themeMode: theme.themeMode,
            theme: ThemeData(
              fontFamily: 'Kine',
              useMaterial3: true,
              colorSchemeSeed:
                  isDynamic ? lightDynamic?.primary ?? themeSeed : themeSeed,
            ),
            darkTheme: ThemeData(
              fontFamily: 'Kine',
              useMaterial3: true,
              colorSchemeSeed:
                  isDynamic ? darkDynamic?.primary ?? themeSeed : themeSeed,
              brightness: Brightness.dark,
            ),
          );
        },
      
    );
  }
}


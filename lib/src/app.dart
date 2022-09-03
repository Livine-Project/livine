import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'features/loading/loading.dart';
import 'features/settings/data/theme.dart';
import 'routing/routes.dart';
import 'shared/styles/lib_color_schemes.g.dart';

class NoConnection extends StatelessWidget {
  const NoConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NoConnectionMaterial();
  }
}

class NoConnectionMaterial extends ConsumerWidget {
  const NoConnectionMaterial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return const MaterialApp(
      home: NoConnectionWidget(),
    );
  }
}

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

    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      useInheritedMediaQuery: true,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          breakpoints: const [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ]),
      themeMode: theme.themeMode,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
    );
  }
}

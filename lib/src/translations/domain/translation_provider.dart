import 'dart:ui';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livine/src/shared/cache/cache_helper.dart';

class TranslationRepo {
  static List<Locale> supportedLocales = [
    Locale('en'),
    Locale('ar'),
  ];

  static AppLocalizations? translate(context) => AppLocalizations.of(context);
}

final localeNotifierProvider =
    StateNotifierProvider<LocaleNotifier, Locale>(
        (ref) => LocaleNotifier(Locale('en')));

class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier(Locale state) : super(_initializeLocale());

  static Locale _initializeLocale() {
    String langCode = CacheHelper.getString('locale') ?? 'en';
    return Locale(langCode);
  }

  setLocale(Locale locale) {
    state = locale;
    CacheHelper.setString('locale', locale.languageCode);
  }

  void clearLocale() => state = Locale('en');
}

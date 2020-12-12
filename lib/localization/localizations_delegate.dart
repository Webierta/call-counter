import 'package:flutter/material.dart';
import '../models/language_data.dart';
import 'language/language_en.dart';
import 'language/language_es.dart';
import 'language/language_de.dart';
import 'language/languages.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationsDelegate();

  static List<String> get _langs => LanguageData.supportedLocales;

  @override
  bool isSupported(Locale locale) => _langs.contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEn();
      case 'es':
        return LanguageEs();
      case 'de':
        return LanguageDe();
      default:
        return LanguageEn();
    }
  }

  static Iterable<Locale> get supportedLocales => _langs.map((lang) => Locale(lang));
  //static Iterable<Locale> supportedLocales = langs.map((lang) => Locale(lang));
  /* static Iterable<Locale> supportedLocales = Iterable<Locale>.generate(
      LanguageData.supportedLocales.length,
      (int index) => Locale(LanguageData.supportedLocales[index])); */

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}

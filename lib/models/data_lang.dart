import '../utils/shared_prefs.dart';
import 'package:flutter/material.dart';

class DataLang with ChangeNotifier {
  final SharedPrefs _sharedPrefs = SharedPrefs();

  String _lang = 'en';

  DataLang() {
    _getPrefLang();
  }

  void _getPrefLang() async {
    await _sharedPrefs.init();
    _lang = _sharedPrefs.lang ?? 'en';
    notifyListeners();
  }

  String get lang => _lang;

  set setPrefLang(String prefLang) {
    _sharedPrefs.lang = prefLang;
    _lang = prefLang;
    notifyListeners();
  }
}

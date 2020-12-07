import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences _sharedPrefs;
  static const String _prefsPlan = 'plan';
  static const String _prefsDia = 'dia';
  static const String _prefsLang = 'lang';

  init() async {
    if (_sharedPrefs == null) {
      _sharedPrefs = await SharedPreferences.getInstance();
    }
  }

  int get plan => _sharedPrefs?.getInt(_prefsPlan);

  set plan(int value) => _sharedPrefs.setInt(_prefsPlan, value);

  int get dia => _sharedPrefs?.getInt(_prefsDia) ?? 1;

  set dia(int value) => _sharedPrefs.setInt(_prefsDia, value);

  String get lang => _sharedPrefs?.getString(_prefsLang) ?? 'en';

  set lang(String value) => _sharedPrefs.setString(_prefsLang, value);
}

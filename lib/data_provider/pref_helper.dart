import 'package:shared_preferences/shared_preferences.dart';

import '/constant/constant_key.dart';

class PrefHelper {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static Future setString(String key, String value) async {
    var _pref = await _instance;
    await _pref.setString(key, value);
  }

  static Future setInt(String key, int value) async {
    var _pref = await _instance;
    await _pref.setInt(key, value);
  }

  static Future setBool(String key, bool value) async {
    var _pref = await _instance;
    await _pref.setBool(key, value);
  }

  static Future setDouble(String key, double value) async {
    var _pref = await _instance;
    await _pref.setDouble(key, value);
  }

  static Future setStringList(String key, List<String> value) async {
    var _pref = await _instance;
    await _pref.setStringList(key, value);
  }

  static String getString(String key, [String defaultValue = ""]) {
    return _prefsInstance?.getString(key) ?? defaultValue;
  }

  static getInt(String key) {
    return _prefsInstance?.getInt(key) ?? 0;
  }

  static getBool(String key) {
    return _prefsInstance?.getBool(key) ?? false;
  }

  static getDouble(String key) {
    return _prefsInstance?.getDouble(key) ?? 0.0;
  }

  static getStringList(String key) {
    return _prefsInstance?.getStringList(key) ?? <String>[];
  }

  static getLanguage() {
    return _prefsInstance?.getInt(AppConstant.LANGUAGE.key) ?? 1;
  }

  static void logout() {
    final languageValue = getLanguage();
    _prefsInstance?.clear();
    _prefsInstance?.setInt(AppConstant.LANGUAGE.key, languageValue);
    _prefsInstance?.remove(AppConstant.TOKEN.key);
  }

  static bool isLoggedIn() {
    return (_prefsInstance?.getInt(AppConstant.USER_ID.key) ?? -1) > 0;
  }
}

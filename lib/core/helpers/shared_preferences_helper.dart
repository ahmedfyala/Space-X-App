import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';

class SharedPreferencesHelper {
  static SharedPreferences? sharedPreferences;

  // MARK: - ✏️ Set Data.
  static setData(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint(
        '[SharedPreferencesHelper] setData with key: $key & value: $value');
    switch (value.runtimeType) {
      case const (String):
        prefs.setString(key, value);
        break;
      case const (int):
        prefs.setInt(key, value);
        break;
      case const (double):
        prefs.setDouble(key, value);
        break;
      case const (bool):
        prefs.setBool(key, value);
        break;
      case const (List):
        prefs.setStringList(key, value);
        break;
      default:
        debugPrint('[SharedPreferencesHelper] There\'s No Type Matched!');
        return null;
    }
  }

  // MARK: - 🗑️ Remove Data.
  static removeData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint('[SharedPreferencesHelper] removeData with key: $key');
    prefs.remove(key);
  }

  // MARK: - 📦 Clear All Data.
  static clearAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint('[SharedPreferencesHelper] clearAllData');
    prefs.clear();
  }

  // MARK: - 🧲 Get Data.
  static getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint('[SharedPreferencesHelper] getData with key: $key');
    debugPrint('[SharedPreferencesHelper] getData with key: ${prefs.get(key)}');
    return prefs.get(key);
  }
}

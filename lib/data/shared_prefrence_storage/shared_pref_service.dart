import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences?> init() async {
    _prefsInstance = await SharedPreferences.getInstance();
    return _prefsInstance;
  }

  static Future<bool> saveDarkMode(bool isDarkMode) async {
    return await _prefsInstance?.setBool("darkMode", isDarkMode) ?? false;
  }

  static bool get getDarkMode {
    return _prefsInstance?.getBool("darkMode") ?? false;
  }

}

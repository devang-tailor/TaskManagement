import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskmanagement/res/exports/common_exports.dart';

final themeModeProvider = ChangeNotifierProvider<ThemeModeProvider>((ref) {
  return ThemeModeProvider();
});

class ThemeModeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  Future<void> loadThemeMode() async {
    final prefs = await SharedPrefService.init();
    if (prefs != null) {
      _isDarkMode = prefs.getBool("darkMode") ?? false;
      notifyListeners();
    }
  }

  void toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
    final prefs = await SharedPrefService.init();
    if (prefs != null) {
      await SharedPrefService.saveDarkMode(_isDarkMode);
    }
  }
}
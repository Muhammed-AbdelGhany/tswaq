import 'package:shared_preferences/shared_preferences.dart';

void saveTheme(bool isDarkTheme) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('theme', isDarkTheme);
}

Future<bool> getTheme() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('theme') ?? false;
}

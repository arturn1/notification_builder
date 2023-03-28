import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseNotifier {
  BaseNotifier._();

  static final BaseNotifier instance = BaseNotifier._();

  final ValueNotifier isDark = ValueNotifier(false);

  setTheme() => isDark.value = !isDark.value;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  saveThemeStatus() async {
    SharedPreferences pref = await _prefs;
    pref.setBool('theme', isDark.value);
  }

  getThemeStatus() async {
    var isLight = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('theme') ?? true;
    });
    isDark.value = (await isLight)!;
  }

  getTheme() => isDark.value ? ThemeMode.dark : ThemeMode.light;
}

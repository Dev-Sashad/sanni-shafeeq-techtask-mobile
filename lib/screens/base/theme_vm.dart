import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeNotifier() {
    setThemeMode();
  }

  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  setThemeMode() async {
    _themeMode = ThemeMode.light;
    notifyListeners();
  }
}

final themeVm = ChangeNotifierProvider.autoDispose<ThemeNotifier>(
  (ref) => ThemeNotifier(),
);

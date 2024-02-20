import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _lightTheme = CupertinoThemeData(brightness: Brightness.light);
const _darkTheme = CupertinoThemeData(
  brightness: Brightness.dark,
);
const _systemTheme = CupertinoThemeData();

CupertinoThemeData getThemeData(ThemeMode? mode) {
  switch (mode) {
    case ThemeMode.light:
      return _lightTheme;
    case ThemeMode.dark:
      return _darkTheme;
    case ThemeMode.system:
      return _systemTheme;
    default:
      return _systemTheme;
  }
}

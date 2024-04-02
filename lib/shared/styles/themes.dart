import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';

Brightness brightness =
    SchedulerBinding.instance.platformDispatcher.platformBrightness;

const _lightTheme = CupertinoThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.offWhiteBackground,
    primaryColor: AppColors.white,
    primaryContrastingColor: AppColors.black);
const _darkTheme = CupertinoThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.semiBlack,
    primaryContrastingColor: AppColors.white);
final _systemTheme = brightness == Brightness.dark ? _darkTheme : _lightTheme;

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

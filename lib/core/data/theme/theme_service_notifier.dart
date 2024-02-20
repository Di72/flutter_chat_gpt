import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';

abstract class ThemeServiceAsyncNotifier extends AsyncNotifier<ThemeMode> {
  @override
  Future<ThemeMode> build();

  Future<void> setTheme(ThemeMode theme);

  ThemeMode getTheme();
}

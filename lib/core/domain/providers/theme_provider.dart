import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_chat_gpt/core/data/theme/theme_service.dart';

final themeProvider =
    AsyncNotifierProvider<ThemeService, ThemeMode>(ThemeService.new);

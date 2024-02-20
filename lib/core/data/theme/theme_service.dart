import 'dart:async';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:flutter_chat_gpt/core/data/theme/theme_service_notifier.dart';
import 'package:flutter_chat_gpt/core/domain/models/collections/theme_collection.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/core/domain/providers/isar_storage_service_provider.dart';

class ThemeService extends ThemeServiceAsyncNotifier {
  late Isar? _isar;

  @override
  Future<ThemeMode> build() async {
    _isar = await ref.watch(storageServiceProvider.notifier).future;
    ThemeMode theme = getTheme();
    return theme;
  }

  @override
  Future<void> setTheme(ThemeMode theme) async {
    ThemeCollection currentTheme = _getCurrentTheme();
    currentTheme.theme = theme;
    _isar?.writeTxnSync(
      () => _isar?.themeCollections.putSync(currentTheme),
    );
    state = AsyncValue.data(theme);
  }

  @override
  ThemeMode getTheme() {
    ThemeCollection? themeCollection = _getCurrentTheme();
    ThemeMode theme = themeCollection.theme;
    state = AsyncValue.data(theme);

    return theme;
  }

  ThemeCollection _getCurrentTheme() {
    ThemeCollection? theme = _isar?.themeCollections.getSync(THEME_STORAGE_ID);
    if (theme == null) {
      theme = ThemeCollection(ThemeMode.system);
      _isar?.writeTxnSync(() {
        _isar?.themeCollections.put(theme!);
      });
      theme = _isar?.themeCollections.getSync(THEME_STORAGE_ID);
    }

    return theme!;
  }
}

import 'dart:async';

import 'package:flutter_chat_gpt/core/domain/collections/theme_collection.dart';
import 'package:isar/isar.dart';
import 'package:flutter_chat_gpt/core/data/theme/theme_service_notifier.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/core/domain/providers/isar_storage_service_provider.dart';

class ThemeService extends ThemeServiceAsyncNotifier {
  Isar? _isar;
  ThemeMode theme = ThemeMode.system;

  @override
  ThemeMode build() {
    getTheme();
    return theme;
  }

  @override
  Future<void> setTheme(ThemeMode theme) async {
    ThemeCollection currentTheme = await _getCurrentTheme();
    currentTheme.theme = theme;
    state = theme;
    _isar?.writeTxnSync(
      () => _isar?.themeCollections.putSync(currentTheme),
    );
  }

  @override
  Future<void> getTheme() async {
    ThemeCollection? themeCollection = await _getCurrentTheme();
    state = themeCollection.theme;
  }

  Future<ThemeCollection> _getCurrentTheme() async {
    _isar = await ref.read(storageServiceProvider.future);
    ThemeCollection? theme = _isar?.themeCollections.getSync(THEME_STORAGE_ID);
    if (theme == null) {
      theme = ThemeCollection(ThemeMode.system);
      await _isar?.writeTxn(() async {
        _isar?.themeCollections.put(theme!);
      });
      theme = _isar?.themeCollections.getSync(THEME_STORAGE_ID);
    }

    return theme!;
  }
}

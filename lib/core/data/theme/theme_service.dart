import 'dart:async';
import 'package:flutter_chat_gpt/core/domain/collections/theme_collection.dart';
import 'package:isar/isar.dart';
import 'package:flutter_chat_gpt/core/data/theme/theme_service_notifier.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/core/domain/providers/isar_storage_service_provider.dart';

class ThemeService extends ThemeServiceAsyncNotifier {
  Isar? _isar; // Optional Isar database instance for storing theme preferences.

  @override
  ThemeMode build() {
    getTheme(); // Fetch and apply the stored theme.
    return ThemeMode.system; // Default theme mode.
  }

  // Asynchronously sets the app's theme and updates the stored theme preference in the Isar database.
  @override
  Future<void> setTheme(ThemeMode theme) async {
    ThemeCollection currentTheme =
        await _getCurrentTheme(); // Fetch the current theme settings.
    currentTheme.theme = theme; // Update the theme.
    state = theme; // Set the new theme as the current state.
    // Write the updated theme to the Isar database synchronously within a write transaction.
    _isar?.writeTxnSync(
      () => _isar?.themeCollections.putSync(currentTheme),
    );
  }

  // Asynchronously fetches the current theme from the Isar database and updates the state.
  @override
  Future<void> getTheme() async {
    ThemeCollection? themeCollection =
        await _getCurrentTheme(); // Fetch the current theme settings.
    state = themeCollection.theme; // Update the state with the fetched theme.
  }

  // Helper function to fetch the current theme from the Isar database or create a default entry if none exists.
  Future<ThemeCollection> _getCurrentTheme() async {
    _isar = await ref.read(storageServiceProvider
        .future); // Obtain the Isar instance from the provider.
    ThemeCollection? theme = _isar?.themeCollections
        .getSync(THEME_STORAGE_ID); // Attempt to fetch the stored theme.
    if (theme == null) {
      // If no theme is stored, create a new theme entry with the default system theme.
      theme = ThemeCollection(ThemeMode.system);
      await _isar?.writeTxn(() async {
        // Save the new theme entry to the Isar database.
        _isar?.themeCollections.put(theme!);
      });
      theme = _isar?.themeCollections
          .getSync(THEME_STORAGE_ID); // Fetch the newly created theme entry.
    }

    return theme!; // Return the current or newly created theme.
  }
}

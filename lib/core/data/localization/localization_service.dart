import 'package:flutter_chat_gpt/core/domain/collections/localization_collection.dart';
import 'package:intl/intl_standalone.dart';
import 'package:isar/isar.dart';
import 'package:flutter_chat_gpt/core/data/localization/localization_service_notifier.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/core/domain/providers/isar_storage_service_provider.dart';

class LocalizationService extends LocalizationServiceNotifier {
  // Declare an Isar instance nullable to later assign it asynchronously.
  late final Isar? _isar;

  // Upon building, set the default locale to English and attempt to fetch the current localization settings.
  @override
  Locale build() {
    getLocalization();
    return const Locale('en');
  }

  // Asynchronously fetches the current locale from local storage (Isar) or defaults to the system locale.
  @override
  Future<void> getLocalization() async {
    // Obtain an Isar instance for data access.
    _isar = await ref.read(storageServiceProvider.future);
    final isar = _isar;

    // Attempt to fetch the stored locale. If none is found, use the system locale.
    String? localeCode = isar?.localizationCollections
            .getSync(LOCALE_STORAGE_ID)
            ?.languageCode ??
        await findSystemLocale(); // Uses intl_standalone to find the system locale.

    // Update the state with the fetched or system locale, primarily considering the language code.
    state = Locale(localeCode.split('_')[0]);
  }

  // Updates the application's locale and saves the new locale to local storage if it's different from the current one.
  @override
  Future<void> setLocalization(Locale newLocale) async {
    // Check if the new locale differs from the current state.
    bool didChange = newLocale.languageCode != state.languageCode;
    // If the locale has changed and is supported by the app, update the state and local storage.
    if (didChange && AppLocalizations.supportedLocales.contains(state)) {
      state = newLocale; // Update the state with the new locale.
      final isar = _isar;
      // Use Isar to persistently store the new locale settings.
      isar?.writeTxnSync(() {
        isar.localizationCollections.putSync(
          LocalizationCollection(newLocale.languageCode, newLocale.countryCode),
        );
      });
    }
  }
}

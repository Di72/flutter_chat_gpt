import 'package:flutter_chat_gpt/core/domain/collections/localization_collection.dart';
import 'package:intl/intl_standalone.dart';
import 'package:isar/isar.dart';
import 'package:flutter_chat_gpt/core/data/localization/localization_service_notifier.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/core/domain/providers/isar_storage_service_provider.dart';

class LocalizationService extends LocalizationServiceNotifier {
  late final Isar? _isar;

  Locale locale = const Locale('en');

  @override
  Locale build() {
    getLocalization();
    return locale;
  }

  @override
  Future<void> getLocalization() async {
    _isar = await ref.read(storageServiceProvider.future);
    final isar = _isar;

    String? localeCode = isar?.localizationCollections
            .getSync(LOCALE_STORAGE_ID)
            ?.languageCode ??
        await findSystemLocale();
    state = Locale(localeCode.split('_')[0]);
  }

  @override
  Future<void> setLocalization(Locale newLocale) async {
    bool didChange = newLocale.languageCode != state.languageCode;
    if (didChange && AppLocalizations.supportedLocales.contains(locale)) {
      state = newLocale;
      final isar = _isar;
      isar?.writeTxnSync(() {
        isar.localizationCollections.putSync(
          LocalizationCollection(newLocale.languageCode, newLocale.countryCode),
        );
      });
    }
  }
}

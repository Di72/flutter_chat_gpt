import 'package:intl/intl_standalone.dart';
import 'package:isar/isar.dart';
import 'package:flutter_chat_gpt/core/data/localization/localization_service_notifier.dart';
import 'package:flutter_chat_gpt/core/domain/models/collections/localization_collection.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/core/domain/providers/isar_storage_service_provider.dart';

class LocalizationService extends LocalizationServiceAsyncNotifier {
  late Isar? _isar;
  AppLocalizations? _strings;
  final Locale _defaultLocal = const Locale('en');

  @override
  AppLocalizations get strings => _strings!;
  @override
  bool get isLoaded => _strings != null;

  @override
  Future<AppLocalizations> build() async {
    _isar = await ref.watch(storageServiceProvider.notifier).future;
    await getLocalization();
    return strings;
  }

  @override
  Future<void> getLocalization() async {
    final isar = _isar;
    Locale locale = _defaultLocal;

    String? localeCode = isar?.localizationCollections
            .getSync(LOCALE_STORAGE_ID)
            ?.languageCode ??
        await findSystemLocale();
    locale = Locale(localeCode.split('_')[0]);
    if (AppLocalizations.supportedLocales.contains(locale) == false) {
      locale = _defaultLocal;
    }

    await _saveLocalization(locale);
  }

  @override
  Future<void> setLocalization(Locale locale) async {
    bool didChange = _strings?.localeName != locale.languageCode;
    if (didChange && AppLocalizations.supportedLocales.contains(locale)) {
      await _saveLocalization(locale);
    }
  }

  Future<void> _saveLocalization(Locale locale) async {
    final isar = _isar;
    isar?.writeTxnSync(() {
      isar.localizationCollections.putSync(
        LocalizationCollection(locale.languageCode, locale.countryCode),
      );
    });

    _strings = await AppLocalizations.delegate.load(locale);
  }
}

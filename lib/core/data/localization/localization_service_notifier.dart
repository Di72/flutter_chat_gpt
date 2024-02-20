import 'package:flutter_chat_gpt/shared/commom_libs.dart';

abstract class LocalizationServiceAsyncNotifier
    extends AsyncNotifier<AppLocalizations> {
  @override
  Future<AppLocalizations> build();

  AppLocalizations get strings;
  bool get isLoaded;

  Future<void> getLocalization();

  Future<void> setLocalization(Locale locale);
}

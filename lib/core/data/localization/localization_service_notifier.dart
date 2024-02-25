import 'package:flutter_chat_gpt/shared/commom_libs.dart';

abstract class LocalizationServiceNotifier extends Notifier<Locale> {
  @override
  Locale build();

  Future<void> getLocalization();

  Future<void> setLocalization(Locale newLocale);
}

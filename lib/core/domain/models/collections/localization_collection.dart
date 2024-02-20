import 'package:isar/isar.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';

part 'localization_collection.g.dart';

@Collection()
class LocalizationCollection {
  LocalizationCollection(this.languageCode, this.countryCode);

  Id id = LOCALE_STORAGE_ID;

  String languageCode;

  String? countryCode;
}

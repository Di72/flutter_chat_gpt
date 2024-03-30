import 'package:isar/isar.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';

part 'theme_collection.g.dart';

@Collection()
class ThemeCollection {
  ThemeCollection(this.theme);

  Id id = THEME_STORAGE_ID;

  @enumerated
  ThemeMode theme;
}

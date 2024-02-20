import 'dart:async';

import 'package:isar/isar.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';

abstract class StorageServiceAsyncNotifier extends AsyncNotifier<Isar> {
  @override
  FutureOr<Isar> build();

  Future<void> clear();

  Future<Isar> openIsar();
}

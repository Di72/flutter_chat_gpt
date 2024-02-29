import 'dart:async';
import 'dart:io';

import 'package:isar/isar.dart';
import 'package:flutter_chat_gpt/core/data/storage/storage_service_notifier.dart';
import 'package:flutter_chat_gpt/core/domain/models/collections/localization_collection.dart';
import 'package:flutter_chat_gpt/core/domain/models/collections/theme_collection.dart';
import 'package:path_provider/path_provider.dart';

class IsarStorageService extends StorageServiceAsyncNotifier {
  @override
  FutureOr<Isar> build() async {
    Isar isar = await openIsar();
    return isar;
  }

  @override
  Future<void> clear() async {
    Isar isar = await openIsar();
    await isar.writeTxn(() => isar.clear());
  }

  @override
  Future<Isar> openIsar() async {
    if (Isar.instanceNames.isEmpty) {
      final Directory dir = await getApplicationDocumentsDirectory();

      await Isar.open(
        [ThemeCollectionSchema, LocalizationCollectionSchema],
        inspector: true,
        directory: dir.path,
      );
    }
    return Isar.getInstance()!;
  }
}

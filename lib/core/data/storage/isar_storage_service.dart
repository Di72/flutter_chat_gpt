import 'dart:async';
import 'dart:io';
import 'package:flutter_chat_gpt/shared/collections/chat_collection.dart';
import 'package:flutter_chat_gpt/core/domain/collections/localization_collection.dart';
import 'package:flutter_chat_gpt/core/domain/collections/theme_collection.dart';
import 'package:isar/isar.dart';
import 'package:flutter_chat_gpt/core/data/storage/storage_service_notifier.dart';
import 'package:path_provider/path_provider.dart';

class IsarStorageService extends StorageServiceAsyncNotifier {
  @override
  FutureOr<Isar> build() async {
    Isar isar = await openIsar(); // Open the Isar database.
    return isar; // Return the Isar instance.
  }

  // The clear method asynchronously clears all data from the Isar database.
  @override
  Future<void> clear() async {
    Isar isar = await openIsar(); // Ensure the Isar database is opened.
    await isar.writeTxn(
        () => isar.clear()); // Clear the database within a write transaction.
  }

  // The openIsar method checks if an Isar instance is already opened; if not, it creates one.
  @override
  Future<Isar> openIsar() async {
    if (Isar.instanceNames.isEmpty) {
      // Check if there are no open Isar instances.
      final Directory dir =
          await getApplicationDocumentsDirectory(); // Get the app's documents directory.

      // Open the Isar database with schemas for Theme, Localization, and Chat collections.
      await Isar.open(
        [
          ThemeCollectionSchema,
          LocalizationCollectionSchema,
          ChatCollectionSchema,
        ],
        inspector: true, // Enable the Isar inspector for debugging.
        directory:
            dir.path, // Specify the directory where Isar data should be stored.
      );
    }
    return Isar.getInstance()!; // Return the opened or existing Isar instance.
  }
}

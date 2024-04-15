import 'dart:async';
import 'dart:io';
import 'package:flutter_chat_gpt/shared/collections/chat_collection.dart';
import 'package:flutter_chat_gpt/core/domain/collections/localization_collection.dart';
import 'package:flutter_chat_gpt/core/domain/collections/theme_collection.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

@singleton
class IsarStorageService {
  late Future<Isar> isar;

  IsarStorageService() {
    isar = openIsar();
  }

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
    return Future.value(
        Isar.getInstance()); // Return the opened or existing Isar instance.
  }
}

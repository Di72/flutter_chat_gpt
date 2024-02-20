import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:flutter_chat_gpt/core/data/storage/isar_storage_service.dart';

final storageServiceProvider =
    AsyncNotifierProvider<IsarStorageService, Isar>(IsarStorageService.new);

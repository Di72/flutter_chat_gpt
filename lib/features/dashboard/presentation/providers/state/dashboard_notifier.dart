import 'package:flutter_chat_gpt/core/domain/collections/chat_collection.dart';
import 'package:flutter_chat_gpt/core/domain/providers/isar_storage_service_provider.dart';
import 'package:flutter_chat_gpt/features/chat/presentation/providers/state/chat_state.dart';
import 'package:flutter_chat_gpt/features/dashboard/presentation/providers/state/dashboard_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

class DashboardAsyncNotifier extends AsyncNotifier<DashboardState> {
  Isar? isar;

  @override
  Future<DashboardState> build() async {
    return const DashboardState();
  }

  Future<void> getChats() async {
    Isar? isar = await ref.watch(storageServiceProvider.future);

    Stream<void> userChanged = isar!.chatCollections.watchLazy();
    userChanged.listen((_) {
      getChats();
    });
    final chatCollections = await isar?.chatCollections.where().findAll();
    if (chatCollections != null) {
      state = AsyncData(
        DashboardState(
          chats: chatCollections
              .map((el) => ChatState(
                    id: el.id.toString(),
                    messages: el.messages,
                    state: const State.initial(),
                  ))
              .toList(),
        ),
      );
    }
  }

  Future<void> deleteChat(String id) async {
    Isar? isar = await ref.watch(storageServiceProvider.future);

    await isar?.writeTxn(() async {
      await isar.chatCollections.delete(int.parse(id));
    });
  }
}

import 'package:flutter_chat_gpt/core/domain/collections/chat_collection.dart';
import 'package:flutter_chat_gpt/core/domain/providers/isar_storage_service_provider.dart';
import 'package:flutter_chat_gpt/features/chat/presentation/providers/state/chat_state.dart';
import 'package:flutter_chat_gpt/features/dashboard/presentation/providers/state/dashboard_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

final chatCollectionsStreamProvider =
    StreamProvider<List<ChatCollection>>((ref) async* {
  final isar = await ref.watch(storageServiceProvider.future);

  await for (var _ in isar.chatCollections.watchLazy(fireImmediately: true)) {
    final chatCollections = await isar.chatCollections.where().findAll();
    yield chatCollections;
  }
});

class DashboardAsyncNotifier extends AsyncNotifier<DashboardState> {
  @override
  Future<DashboardState> build() async {
    return const DashboardState();
  }

  void watchChats() {
    ref.listen<AsyncValue<List<ChatCollection>>>(chatCollectionsStreamProvider,
        (_, state) {
      state.whenData((chatCollections) {
        final newChats = chatCollections
            .map((el) => ChatState(
                  id: el.id.toString(),
                  messages: el.messages,
                  date: el.date,
                  state: const State.initial(),
                ))
            .toList();
        newChats.sort((a, b) => b.date!.compareTo(a.date!));

        this.state = AsyncData(
          DashboardState(chats: newChats),
        );
      });
    });
  }

  Future<void> deleteChat(String id) async {
    final isar = await ref.read(storageServiceProvider.future);
    await isar.writeTxn(() async {
      await isar.chatCollections.delete(int.parse(id));
    });
  }
}

import 'package:flutter_chat_gpt/core/domain/collections/chat_collection.dart';
import 'package:flutter_chat_gpt/core/domain/providers/isar_storage_service_provider.dart';
import 'package:flutter_chat_gpt/features/chat/presentation/providers/state/chat_state.dart';
import 'package:flutter_chat_gpt/features/dashboard/presentation/providers/state/dashboard_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

// Defines a stream provider to listen for changes in the chat collections stored in Isar database.
// This provider allows widgets to reactively update whenever the chat collections change.
final chatCollectionsStreamProvider =
    StreamProvider<List<ChatCollection>>((ref) async* {
  // Access the Isar instance from the storage service provider.
  final isar = await ref.watch(storageServiceProvider.future);

  // Watch for any changes in the chat collections. `fireImmediately: true` ensures that
  // the current state of chat collections is emitted immediately when the stream starts.
  await for (var _ in isar.chatCollections.watchLazy(fireImmediately: true)) {
    // Fetch all chat collections from the database and yield them to the stream.
    final chatCollections = await isar.chatCollections.where().findAll();
    yield chatCollections;
  }
});

// DashboardAsyncNotifier is responsible for updating the dashboard state based on changes
// in chat collections and other interactions.
class DashboardAsyncNotifier extends AsyncNotifier<DashboardState> {
  // Initial state construction for the dashboard. In this case, it returns an empty DashboardState.
  @override
  Future<DashboardState> build() async {
    return const DashboardState();
  }

  // This method sets up a listener for the chatCollectionsStreamProvider and updates
  // the dashboard state with the latest chat collections whenever they change.
  void watchChats() {
    ref.listen<AsyncValue<List<ChatCollection>>>(chatCollectionsStreamProvider,
        (_, state) {
      // When new data is received, transform each ChatCollection into a ChatState and sort them by date.
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

        // Update the dashboard state with the new list of sorted chat states.
        this.state = AsyncData(
          DashboardState(chats: newChats),
        );
      });
    });
  }

  // Method for deleting a chat by its ID. This modifies the chat collections in the Isar database.
  Future<void> deleteChat(String id) async {
    // Access the Isar instance and perform a transaction to delete the specified chat collection.
    final isar = await ref.read(storageServiceProvider.future);
    await isar.writeTxn(() async {
      await isar.chatCollections.delete(int.parse(id));
    });
  }
}

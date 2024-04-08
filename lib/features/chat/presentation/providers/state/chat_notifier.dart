import 'package:flutter_chat_gpt/core/domain/collections/chat_collection.dart';
import 'package:flutter_chat_gpt/core/domain/models/chat_message/chat_message.dart';
import 'package:flutter_chat_gpt/core/domain/providers/isar_storage_service_provider.dart';
import 'package:flutter_chat_gpt/features/chat/domain/providers/chat_providers.dart';
import 'package:flutter_chat_gpt/features/chat/domain/repositories/chat_repository.dart';
import 'package:flutter_chat_gpt/features/chat/presentation/providers/state/chat_state.dart';
import 'package:flutter_chat_gpt/shared/constants/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

// Defines a notifier for managing chat state, including loading, updating, and sending messages.
class ChatAutoDisposeAsyncNotifier extends AutoDisposeAsyncNotifier<ChatState> {
  late ChatRepository
      _chatRepository; // Repository for interacting with chat data.
  Isar? _isar; // Isar database instance for local storage.

  // Helper getter to easily check if the current state is loading.
  bool get isloading => state.value?.state == const State.loading();

  // Initial setup for the notifier, including obtaining necessary instances from providers.
  @override
  Future<ChatState> build() async {
    _isar = await ref
        .watch(storageServiceProvider.future); // Access Isar database instance.
    _chatRepository =
        ref.watch(chatRepositoryProvider); // Access chat repository.
    return const ChatState.initial(); // Return initial state.
  }

  // Sets the chat state based on a given chat ID. Loads chat data from Isar if available.
  Future<void> setState(String id) async {
    final previousState =
        await _isar?.chatCollections.get(int.parse(id)); // Load chat from Isar.

    // Update the notifier's state with the loaded chat data.
    state = AsyncData(
      ChatState(
        id: previousState?.id.toString() ?? "",
        messages: previousState?.messages ?? [],
        state: const State.success(),
      ),
    );
  }

  // Sends a message and updates the chat state accordingly.
  void sendMessage(String message) async {
    // Add the new message to the current list of messages.
    List<ChatMessage> messages = [
      ...state.value?.messages ?? [],
      ChatMessage(role: "user", content: message)
    ];

    // Set state to loading and update messages.
    state = AsyncData(
      state.value!.copyWith(state: const State.loading(), messages: messages),
    );

    // Update chat storage with the new list of messages.
    await updateChatStorage(
        id: state.value?.id, messages: messages.cast<ChatMessage>());

    // Attempt to send the message via the chat repository.
    final result = await _chatRepository.sendMessage(messages: messages);

    // Handle the response or error from sending the message.
    result.fold(
      (error) {
        // If error, update state to reflect failure.
        state = AsyncData(
          state.value!.copyWith(
            state: State.failure(error),
          ),
        );
      },
      (response) async {
        // On success, update the messages with the response and update storage.
        final responseMessages = [
          ...state.value?.messages ?? [],
          ...response.choices.map(
            (choice) => ChatMessage(
                role: choice.message.role, content: choice.message.content),
          )
        ];
        state = AsyncData(
          state.value!.copyWith(
            state: const State.success(),
            messages: responseMessages.cast<ChatMessage>(),
          ),
        );
        await updateChatStorage(
            id: state.value?.id,
            messages: responseMessages.cast<ChatMessage>());
      },
    );
  }

  // Updates the local storage with the current chat state, including messages and date.
  Future<void> updateChatStorage({
    required List<ChatMessage> messages,
    String? id,
  }) async {
    ChatCollection? chat;
    if (id != NEW_CHAT && id != "") {
      // If updating an existing chat, load it and update its messages and date.
      chat = _isar?.chatCollections.getSync(int.parse(id!));
      chat!.messages = messages;
      chat.date = DateTime.now();
    } else {
      // If creating a new chat, initialize a new ChatCollection.
      chat = ChatCollection(messages, DateTime.now());
    }

    // Write the updated or new chat to Isar database.
    await _isar?.writeTxn(() async {
      await _isar?.chatCollections.put(chat!);
    });
    // Update the notifier's state with the new chat data.
    state = AsyncData(
      state.value!.copyWith(
        id: chat.id.toString(),
        messages: messages.cast<ChatMessage>(),
      ),
    );
  }
}

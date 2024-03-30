import 'package:flutter_chat_gpt/core/domain/collections/chat_collection.dart';
import 'package:flutter_chat_gpt/core/domain/models/chat_message/chat_message.dart';
import 'package:flutter_chat_gpt/core/domain/providers/isar_storage_service_provider.dart';
import 'package:flutter_chat_gpt/features/chat/domain/providers/chat_providers.dart';
import 'package:flutter_chat_gpt/features/chat/domain/repositories/chat_repository.dart';
import 'package:flutter_chat_gpt/features/chat/presentation/providers/state/chat_state.dart';
import 'package:flutter_chat_gpt/shared/constants/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:isar/isar.dart';

class ChatAutoDisposeAsyncNotifier extends AutoDisposeAsyncNotifier<ChatState> {
  late ChatRepository _chatRepository;
  Isar? _isar;

  bool get isloading => state.value?.state == const State.loading();

  @override
  Future<ChatState> build() async {
    _isar = await ref.watch(storageServiceProvider.future);
    _chatRepository = ref.watch(chatRepositoryProvider);
    return const ChatState.initial();
  }

  Future<void> setState(String id) async {
    await build();
    final previousState = await _isar?.chatCollections.get(int.parse(id));

    state = AsyncData(
      ChatState(
        id: previousState?.id.toString() ?? "",
        messages: previousState?.messages ?? [],
        state: const State.success(),
      ),
    );
  }

  void sendMessage(String message) async {
    List<ChatMessage> messages = [
      ...state.value?.messages ?? [],
      ChatMessage(role: "user", content: message)
    ];

    state = AsyncData(
      state.value!.copyWith(state: const State.loading(), messages: messages),
    );

    await updateChatStorage(
        id: state.value?.id, messages: messages.cast<ChatMessage>());

    final result = await _chatRepository.sendMessage(messages: messages);

    result.fold(
      (error) {
        state = AsyncData(
          state.value!.copyWith(
            state: State.failure(error),
          ),
        );
      },
      (response) async {
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

  Future<void> updateChatStorage({
    required List<ChatMessage> messages,
    String? id,
  }) async {
    ChatCollection? chat;
    if (id != NEW_CHAT && id != "") {
      chat = _isar?.chatCollections.getSync(int.parse(id!));
      chat!.messages = messages;
      chat.date = DateTime.now();
    } else {
      chat = ChatCollection(messages, DateTime.now());
    }

    await _isar?.writeTxn(() async {
      await _isar?.chatCollections.put(chat!);
    });
    state = AsyncData(
      state.value!.copyWith(
        id: chat.id.toString(),
        messages: messages.cast<ChatMessage>(),
      ),
    );
  }
}

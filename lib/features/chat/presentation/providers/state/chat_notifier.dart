import 'package:flutter_chat_gpt/core/domain/models/chat_message/chat_message.dart';
import 'package:flutter_chat_gpt/features/chat/domain/providers/chat_providers.dart';
import 'package:flutter_chat_gpt/features/chat/domain/repositories/chat_repository.dart';
import 'package:flutter_chat_gpt/features/chat/presentation/providers/state/chat_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatAutoDisposeAsyncNotifier extends AutoDisposeAsyncNotifier<ChatState> {
  late ChatRepository chatRepository;

  @override
  Future<ChatState> build() async {
    chatRepository = ref.read(chatRepositoryProvider);
    return const ChatState.initial();
  }

  bool get isFetching => state.value?.state != const State.loading();

  void sendMessage(String message) async {
    final previousState = await future;

    List<ChatMessage> messages = [
      ...previousState.messages,
      ChatMessage(role: "user", content: message)
    ];

    state =
        AsyncData(ChatState(state: const State.loading(), messages: messages));

    final result = await chatRepository.sendMessage(messages: messages);

    result.fold(
      (error) {
        state = AsyncData(
          ChatState(
            state: State.failure(error),
            messages: [
              ...state.value?.messages ?? [],
            ],
          ),
        );
      },
      (response) {
        state = AsyncData(
          ChatState(
            state: const State.success(),
            messages: [
              ...state.value?.messages ?? [],
              ...response.choices.map(
                (choice) => ChatMessage(
                    role: choice.message.role, content: choice.message.content),
              )
            ],
          ),
        );
      },
    );
  }

  void resetState() {
    state = const AsyncData(ChatState.initial());
  }
}

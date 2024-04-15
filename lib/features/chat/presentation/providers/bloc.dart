import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_gpt/features/chat/data/repositories/chat_repository.dart';
import 'package:flutter_chat_gpt/features/chat/presentation/providers/state/chat_state.dart';
import 'package:flutter_chat_gpt/shared/collections/chat_collection.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/shared/models/chat_message/chat_message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'bloc.freezed.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.started(String id) = ChatEventStarted;
  const factory ChatEvent.setMessage(String id) = ChatEventSetMessage;
  const factory ChatEvent.sendMessage(String message) = ChatEventSendMessage;
}

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRemoteRepository chatRepository;
  final IsarStorageService isarService;

  ChatBloc(this.chatRepository, this.isarService) : super(ChatState.initial()) {
    on<ChatEventStarted>(_started);
    on<ChatEventSetMessage>(_setMessage);
    on<ChatEventSendMessage>(_sendMessage);
  }

  Future<void> _started(ChatEventStarted event, Emitter<ChatState> emit) async {
    emit(state.copyWith(status: Status.loading()));
    try {
      final isar = await isarService.isar;
      final chatCollections = await isar.chatCollections.where().findAll();
    } catch (e) {
      emit(state.copyWith(status: Status.failure(e)));
    }
  }

  void _setMessage(ChatEventSetMessage event, Emitter<ChatState> emit) {
    emit(ChatState(status: Status.loading()));
    try {
      final messages = state.messages;
      emit(ChatState(
          messages: messages, status: const Status.success(), id: event.id));
    } catch (e) {
      emit(ChatState(
          status: Status.failure(
              'Failed to set messages for chat ID: ${event.id}')));
    }
  }

  Future<void> _sendMessage(
      ChatEventSendMessage event, Emitter<ChatState> emit) async {
    emit(ChatState(status: Status.loading()));
    List<ChatMessage> messages = [
      ...state.messages,
      ChatMessage(role: "user", content: event.message)
    ];
    emit(
      state.copyWith(status: Status.loading(), messages: messages),
    );
    try {
      final result = await chatRepository.sendMessage(messages: messages);
      final responseMessages = [
        ...state.messages,
        ...result.choices.map(
          (choice) => ChatMessage(
              role: choice.message.role, content: choice.message.content),
        )
      ];
      emit(
        state.copyWith(status: Status.success(), messages: responseMessages),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: Status.failure(e.toString()),
        ),
      );
    }
  }
}

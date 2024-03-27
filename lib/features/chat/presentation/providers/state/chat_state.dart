import 'package:equatable/equatable.dart';
import 'package:flutter_chat_gpt/core/domain/models/chat_message/chat_message.dart';
import 'package:flutter_chat_gpt/shared/exceptions/http_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.freezed.dart';

class ChatState extends Equatable {
  final List<ChatMessage> messages;
  final State state;
  final String id;
  final DateTime? date;
  const ChatState({
    this.messages = const [],
    this.id = "",
    this.state = const State.initial(),
    this.date,
  });

  const ChatState.initial({
    this.messages = const [],
    this.id = "",
    this.state = const State.initial(),
    this.date,
  });

  ChatState copyWith({
    List<ChatMessage>? messages,
    String? id,
    State? state,
    DateTime? date,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      id: id ?? this.id,
      state: state ?? this.state,
      date: date ?? this.date,
    );
  }

  @override
  List<Object?> get props => [id, messages, state, date];
}

@freezed
abstract class State with _$State {
  const factory State.initial() = Initial;
  const factory State.loading() = Loading;
  const factory State.failure(AppException exception) = Failure;
  const factory State.success() = Success;
}

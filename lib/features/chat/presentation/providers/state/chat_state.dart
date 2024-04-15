import 'package:equatable/equatable.dart';
import 'package:flutter_chat_gpt/shared/models/chat_message/chat_message.dart';
import 'package:flutter_chat_gpt/exceptions/http_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.freezed.dart';

class ChatState extends Equatable {
  final List<ChatMessage> messages;
  final Status status;
  final String id;
  final DateTime? date;
  const ChatState({
    this.messages = const [],
    this.id = "",
    this.status = const Status.initial(),
    this.date,
  });

  const ChatState.initial({
    this.messages = const [],
    this.id = "",
    this.status = const Status.initial(),
    this.date,
  });

  ChatState copyWith({
    List<ChatMessage>? messages,
    String? id,
    Status? status,
    DateTime? date,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      id: id ?? this.id,
      status: status ?? this.status,
      date: date ?? this.date,
    );
  }

  @override
  List<Object?> get props => [id, messages, status, date];
}

@freezed
abstract class Status with _$Status {
  const factory Status.initial() = Initial;
  const factory Status.loading() = Loading;
  const factory Status.failure(error) = Failure;
  const factory Status.success() = Success;
}

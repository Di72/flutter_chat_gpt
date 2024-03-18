import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'completions_request_model.freezed.dart';
part 'completions_request_model.g.dart';

@freezed
class CompletionsRequestModel with _$CompletionsRequestModel {
  factory CompletionsRequestModel({
    @Default(DEFAULT_MODEL) String model,
    required List<ChatMessage> messages,
  }) = _CompletionsRequestModel;

  factory CompletionsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CompletionsRequestModelFromJson(json);
}

@freezed
class ChatMessage with _$ChatMessage {
  factory ChatMessage({
    @Default("user") String role,
    @Default("") String content,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}

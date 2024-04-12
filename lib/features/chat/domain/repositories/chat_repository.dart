import 'package:flutter_chat_gpt/shared/models/chat_message/chat_message.dart';
import 'package:flutter_chat_gpt/features/chat/domain/models/completions/completions_response/completions_response_model.dart';
import 'package:flutter_chat_gpt/core/domain/models/either.dart';
import 'package:flutter_chat_gpt/exceptions/http_exception.dart';

abstract class ChatRepository {
  Future<Either<AppException, CompletionsResponseModel>> sendMessage(
      {required List<ChatMessage> messages});
}

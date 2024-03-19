import 'package:flutter_chat_gpt/core/domain/models/chat_message/chat_message.dart';
import 'package:flutter_chat_gpt/core/domain/models/completions/completions_response/completions_response_model.dart';
import 'package:flutter_chat_gpt/core/domain/models/either.dart';
import 'package:flutter_chat_gpt/features/Chat/data/datasource/Chat_remote_datasource.dart';
import 'package:flutter_chat_gpt/features/chat/domain/repositories/chat_repository.dart';
import 'package:flutter_chat_gpt/shared/exceptions/http_exception.dart';

class ChatRepositoryImpl extends ChatRepository {
  final ChatDatasource chatdDatasource;
  ChatRepositoryImpl(this.chatdDatasource);

  @override
  Future<Either<AppException, CompletionsResponseModel>> sendMessage(
      {required List<ChatMessage> messages}) {
    return chatdDatasource.sendMessage(messages: messages);
  }
}

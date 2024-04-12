import 'package:flutter_chat_gpt/features/chat/domain/models/completions/completions_request/completions_request_model.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/shared/models/chat_message/chat_message.dart';
import 'package:flutter_chat_gpt/features/chat/domain/models/completions/completions_response/completions_response_model.dart';
import 'package:flutter_chat_gpt/core/domain/models/either.dart';
import 'package:flutter_chat_gpt/features/Chat/data/datasource/Chat_remote_datasource.dart';
import 'package:flutter_chat_gpt/features/chat/data/data_source/chat_api.dart';
import 'package:flutter_chat_gpt/exceptions/http_exception.dart';

// final chatDatasourceProvider = Provider.family<ChatApi, Dio>(
//   (_, networkService) => ChatApi(networkService),
// );

// final chatRepositoryProvider = Provider<ChatRepository>((ref) {
//   final dioService = ref.watch(dioServiceProvider);
//   final datasource = ref.watch(chatDatasourceProvider(dioService));
//   final repository = ChatRepositoryImpl(datasource);

//   return repository;
// });

// Implementation of ChatDatasource using a network service.
class ChatRemoteDatasource {
  // Dependency on a NetworkService to perform HTTP requests.
  final ChatApi chatApi;

  ChatRemoteDatasource(this.chatApi);

  Future<Either<AppException, CompletionsResponseModel>> sendMessage(
      {required List<ChatMessage> messages}) async {
    // Sending a POST request to the specified endpoint with messages.
    final response = await chatApi.sendMessage(
      CompletionsRequestModel(
        model: DEFAULT_MODEL, // Default model for message completion.
        messages: messages, // List of chat messages to be sent.
      ), // Serializing request data to JSON.
    );

    // Handling the response or error from the network service.
    return response.fold(
      (l) => Left(l), // In case of error, wrap and return the AppException.
      (r) {
        try {
          final completionResponse = r;
          // If successful, wrap and return the parsed response model.
          return Right(completionResponse);
        } catch (e) {
          // In case of parsing error, wrap and return an AppException.
          return Left(
            AppException(
              identifier: 'sendMessage',
              statusCode: 0,
              message: "Error parsing response data: ${e.toString()}",
            ),
          );
        }
      },
    );
  }
}

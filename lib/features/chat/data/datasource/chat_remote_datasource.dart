import 'package:flutter_chat_gpt/core/data/network/network_service.dart';
import 'package:flutter_chat_gpt/core/domain/models/chat_message/chat_message.dart';
import 'package:flutter_chat_gpt/core/domain/models/completions/completions_request/completions_request_model.dart';
import 'package:flutter_chat_gpt/core/domain/models/completions/completions_response/completions_response_model.dart';
import 'package:flutter_chat_gpt/core/domain/models/either.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/shared/exceptions/http_exception.dart';

// Abstract class defining the contract for a chat data source.
abstract class ChatDatasource {
  // Method signature for sending chat messages. It returns an Either type encapsulating either an AppException or a CompletionsResponseModel.
  Future<Either<AppException, CompletionsResponseModel>> sendMessage(
      {required List<ChatMessage> messages});
}

// Implementation of ChatDatasource using a network service.
class ChatRemoteDatasource extends ChatDatasource {
  // Dependency on a NetworkService to perform HTTP requests.
  final NetworkService networkService;

  ChatRemoteDatasource(this.networkService);

  @override
  Future<Either<AppException, CompletionsResponseModel>> sendMessage(
      {required List<ChatMessage> messages}) async {
    // Sending a POST request to the specified endpoint with messages.
    final response = await networkService.post(
      '/chat/completions',
      data: CompletionsRequestModel(
        model: DEFAULT_MODEL, // Default model for message completion.
        messages: messages, // List of chat messages to be sent.
      ).toJson(), // Serializing request data to JSON.
    );

    // Handling the response or error from the network service.
    return response.fold(
      (l) => Left(l), // In case of error, wrap and return the AppException.
      (r) {
        try {
          // Attempt to parse the JSON response into a CompletionsResponseModel.
          final jsonData = r.data;
          final completionResponse =
              CompletionsResponseModel.fromJson(jsonData);
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

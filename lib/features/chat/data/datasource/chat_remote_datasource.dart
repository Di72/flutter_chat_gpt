import 'package:flutter_chat_gpt/core/data/network/network_service.dart';
import 'package:flutter_chat_gpt/core/domain/models/chat_message/chat_message.dart';
import 'package:flutter_chat_gpt/core/domain/models/completions/completions_request/completions_request_model.dart';

import 'package:flutter_chat_gpt/core/domain/models/completions/completions_response/completions_response_model.dart';
import 'package:flutter_chat_gpt/core/domain/models/either.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/shared/exceptions/http_exception.dart';

abstract class ChatDatasource {
  Future<Either<AppException, CompletionsResponseModel>> sendMessage(
      {required List<ChatMessage> messages});
}

class ChatRemoteDatasource extends ChatDatasource {
  final NetworkService networkService;
  ChatRemoteDatasource(this.networkService);

  @override
  Future<Either<AppException, CompletionsResponseModel>> sendMessage(
      {required List<ChatMessage> messages}) async {
    final response = await networkService.post(
      '/chat/completions',
      data: CompletionsRequestModel(
        model: DEFAULT_MODEL,
        messages: messages,
      ).toJson(),
    );

    return response.fold(
      (l) => Left(l),
      (r) {
        try {
          final jsonData = r.data;
          final completionResponse =
              CompletionsResponseModel.fromJson(jsonData);
          return Right(completionResponse);
        } catch (e) {
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

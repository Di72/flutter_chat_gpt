import 'package:flutter_chat_gpt/core/data/network/network_service.dart';
import 'package:flutter_chat_gpt/core/domain/models/completions/%D1%81ompletions_request/completions_request_model.dart';
import 'package:flutter_chat_gpt/core/domain/models/completions/completions_response/completions_response_model.dart';
import 'package:flutter_chat_gpt/core/domain/models/either.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/shared/exceptions/http_exception.dart';

abstract class ChatDatasource {
  Future<Either<AppException, CompletionsResponseModel>> sendMessage(
      {required String message});
}

class ChatRemoteDatasource extends ChatDatasource {
  final NetworkService networkService;
  ChatRemoteDatasource(this.networkService);

  @override
  Future<Either<AppException, CompletionsResponseModel>> sendMessage(
      {required String message}) async {
    final response = await networkService.post(
      '/chat/completions',
      data: CompletionsRequestModel(
        model: DEFAULT_MODEL,
        messages: [
          ChatMessage(
            role: "user",
            content: message,
          )
        ],
      ).toJson(),
    );

    return response.fold(
      (l) => Left(l),
      (r) {
        final jsonData = r.data;
        if (jsonData == null) {
          return Left(AppException(
            identifier: 'sendMessage',
            statusCode: 0,
            message: "The data is not in the valid format.",
          ));
        } else {
          final completionResponse =
              CompletionsResponseModel.fromJson(jsonData);
          return Right(completionResponse);
        }
      },
    );
  }
}

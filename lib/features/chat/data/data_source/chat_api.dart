import 'package:dio/dio.dart';
import 'package:flutter_chat_gpt/features/chat/domain/models/completions/completions_request/completions_request_model.dart';
import 'package:flutter_chat_gpt/features/chat/domain/models/completions/completions_response/completions_response_model.dart';
import 'package:flutter_chat_gpt/core/domain/models/either.dart';
import 'package:flutter_chat_gpt/exceptions/http_exception.dart';
import 'package:retrofit/retrofit.dart';

part 'chat_api.g.dart';

@RestApi()
abstract class ChatApi {
  factory ChatApi(Dio dio, String? baseUrl) = _ChatApi;

  @POST('/chat/completions')
  Future<Either<AppException, CompletionsResponseModel>> sendMessage(
      @Body() CompletionsRequestModel completionsRequestModel);
}

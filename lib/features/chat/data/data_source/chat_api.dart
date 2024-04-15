import 'package:dio/dio.dart';
import 'package:flutter_chat_gpt/features/chat/domain/models/completions/completions_request/completions_request_model.dart';
import 'package:flutter_chat_gpt/features/chat/domain/models/completions/completions_response/completions_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'chat_api.g.dart';

@RestApi()
@singleton
abstract class ChatApi {
  @factoryMethod
  factory ChatApi(
    Dio dio, {
    @Named('baseUrl') required String baseUrl,
  }) = _ChatApi;

  @POST('/chat/completions')
  Future<CompletionsResponseModel> sendMessage(
      @Body() CompletionsRequestModel completionsRequestModel);
}

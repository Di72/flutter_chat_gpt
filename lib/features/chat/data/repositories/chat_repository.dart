import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_chat_gpt/features/chat/domain/models/completions/completions_request/completions_request_model.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/shared/models/chat_message/chat_message.dart';
import 'package:flutter_chat_gpt/features/chat/domain/models/completions/completions_response/completions_response_model.dart';
import 'package:flutter_chat_gpt/features/chat/data/data_source/chat_api.dart';
import 'package:flutter_chat_gpt/shared/widgets/app_notification.dart';
import 'package:overlay_support/overlay_support.dart';

@Injectable()
class ChatRemoteRepository {
  final ChatApi chatApi;

  ChatRemoteRepository({required this.chatApi});

  Future<CompletionsResponseModel> sendMessage(
      {required List<ChatMessage> messages}) async {
    final response = await chatApi
        .sendMessage(
      CompletionsRequestModel(
        model: DEFAULT_MODEL, // Default model for message completion.
        messages: messages, // List of chat messages to be sent.
      ),
    )
        .catchError((obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioException:
          // Here's the sample to get the failed response error code and message
          final res = (obj as DioException).response;
          log('Got error : ${res?.statusCode} -> ${res?.statusMessage}');
          showOverlayNotification(
            (context) => AppNotification.error(
              context,
              res?.requestOptions.toString() ?? "",
            ),
          );
          break;
        default:
          break;
      }
    });

    return response;
  }
}

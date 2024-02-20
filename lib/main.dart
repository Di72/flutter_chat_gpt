import 'package:flutter_chat_gpt/shared/main/env_info.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/shared/main/app_config.dart';
import 'package:flutter_chat_gpt/shared/main/observers.dart';

void main() => mainCommon(AppEnvironment.PROD);

Future<void> mainCommon(AppEnvironment environment) async {
  await AppConfig().bootstrap(environment);

  runApp(
    ProviderScope(
      observers: [
        Observers(),
      ],
      child: const ChatGptApp(),
    ),
  );
}

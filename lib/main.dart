import 'package:flutter_chat_gpt/shared/main/env_info.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_chat_gpt/shared/main/app_config.dart';
import 'package:flutter_chat_gpt/shared/main/observers.dart';

// By default run app in prod mode
void main() => mainCommon(AppEnvironment.PROD);

Future<void> mainCommon(AppEnvironment environment) async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Keep native splash screen up until app is finished bootstrapping
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Start app
  runApp(
    ProviderScope(
      observers: [
        // For logging the state of providers
        Observers(),
      ],
      child: const ChatGptApp(),
    ),
  );
  await AppConfig().bootstrap(environment);
  // Remove splash screen when bootstrap is complete
  FlutterNativeSplash.remove();
}

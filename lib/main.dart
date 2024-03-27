import 'package:flutter_chat_gpt/shared/main/env_info.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_chat_gpt/shared/main/app_config.dart';
import 'package:flutter_chat_gpt/shared/main/observers.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:statsfl/statsfl.dart';

// By default run app in prod mode
void main() => mainCommon(AppEnvironment.PROD);

Future<void> mainCommon(AppEnvironment environment) async {
  await dotenv.load(fileName: ".env");
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Keep native splash screen up until app is finished bootstrapping
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await AppConfig().bootstrap(environment);
  // Remove splash screen when bootstrap is complete
  FlutterNativeSplash.remove();
// Start sentry
  await SentryFlutter.init(
    (options) {
      options.dsn = SENTRY_DSN;
      options.tracesSampleRate = 1.0;
    },
    // Start app
    appRunner: () => runApp(
      ProviderScope(
        observers: [
          // For logging the state of providers
          Observers(),
        ],
        // FPS monitor
        child: StatsFl(
          isEnabled: false,
          width: 200,
          height: 20,
          maxFps: 90,
          showText: true,
          sampleTime: .5,
          totalTime: 10,
          align: Alignment.bottomLeft,
          child: const ChatGptApp(),
        ),
      ),
    ),
  );
}

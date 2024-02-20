import 'package:flutter/material.dart';
import 'package:flutter_chat_gpt/core/domain/providers/localization_provider.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/core/domain/providers/theme_provider.dart';
import 'package:flutter_chat_gpt/shared/styles/styles.dart';

class ChatGptApp extends ConsumerWidget {
  const ChatGptApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.watch(themeProvider);

    return CupertinoApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationProvider: appRouter.routeInformationProvider,
        routeInformationParser: appRouter.routeInformationParser,
        routerDelegate: appRouter.routerDelegate,
        theme: themeNotifier.maybeWhen(
          data: (themeMode) => getThemeData(themeMode),
          orElse: () => getThemeData(ThemeMode.system),
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales);
  }
}

final container = ProviderContainer();

final localizationService = container.read(localizationProvider.notifier);

/// Global helpers for readability
AppLocalizations get $strings => localizationService.strings;
AppStyle get $styles => ChatGptAppScaffold.style;

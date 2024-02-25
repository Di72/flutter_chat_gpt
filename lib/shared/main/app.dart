import 'package:flutter/material.dart';
import 'package:flutter_chat_gpt/core/domain/providers/localization_provider.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/core/domain/providers/theme_provider.dart';
import 'package:flutter_chat_gpt/shared/utils/app_shortcuts.dart';

class ChatGptApp extends ConsumerWidget {
  static late final AppLocalizations? strings;

  const ChatGptApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final themeNotifier = ref.watch(themeProvider);
    final locale = ref.watch(localizationProvider);

    return CupertinoApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationProvider: appRouter.routeInformationProvider,
        routeInformationParser: appRouter.routeInformationParser,
        routerDelegate: appRouter.routerDelegate,
        shortcuts: AppShortcuts.defaults,
        locale: locale,
        theme: getThemeData(themeNotifier),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales);
  }
}

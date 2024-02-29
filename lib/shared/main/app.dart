import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_gpt/core/domain/providers/localization_provider.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/core/domain/providers/theme_provider.dart';
import 'package:flutter_chat_gpt/shared/utils/app_shortcuts.dart';

class ChatGptApp extends ConsumerWidget {
  const ChatGptApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final theme = ref.watch(themeProvider);
    final locale = ref.watch(localizationProvider);

    return CupertinoApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationProvider: appRouter.routeInformationProvider,
        routeInformationParser: appRouter.routeInformationParser,
        routerDelegate: appRouter.routerDelegate,
        shortcuts: AppShortcuts.defaults,
        locale: locale,
        theme: getThemeData(theme),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales);
  }
}

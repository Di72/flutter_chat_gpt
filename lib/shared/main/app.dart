import 'package:feedback/feedback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_gpt/core/domain/providers/localization_provider.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/core/domain/providers/theme_provider.dart';
import 'package:flutter_chat_gpt/shared/utils/app_shortcuts.dart';
import 'package:overlay_support/overlay_support.dart';

class ChatGptApp extends ConsumerWidget {
  const ChatGptApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final theme = ref.watch(themeProvider);
    final locale = ref.watch(localizationProvider);

    return BetterFeedback(
      theme: FeedbackThemeData(
        background: AppColors.activeGreen,
        feedbackSheetColor: AppColors.white,
        drawColors: [
          Colors.red,
          Colors.green,
          Colors.blue,
          Colors.yellow,
        ],
      ),
      localizationsDelegates: _getLocalizationsDelegates,
      localeOverride: locale,
      child: OverlaySupport.global(
        child: CupertinoApp.router(
          debugShowCheckedModeBanner: false,
          routeInformationProvider: appRouter.routeInformationProvider,
          routeInformationParser: appRouter.routeInformationParser,
          routerDelegate: appRouter.routerDelegate,
          shortcuts: AppShortcuts.defaults,
          locale: locale,
          theme: getThemeData(theme),
          localizationsDelegates: _getLocalizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );
  }

  List<LocalizationsDelegate<dynamic>> get _getLocalizationsDelegates {
    return const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
  }
}

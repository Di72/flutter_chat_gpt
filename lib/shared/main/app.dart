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
    // Watch for theme changes using the themeProvider.
    final theme = ref.watch(themeProvider);
    // Watch for locale changes using the localizationProvider.
    final locale = ref.watch(localizationProvider);

    // BetterFeedback is used for collecting feedback from users.
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
      localizationsDelegates:
          _getLocalizationsDelegates, // Delegates for app localization.
      localeOverride:
          locale, // Override the locale based on the app's selected locale.
      child: OverlaySupport.global(
        // OverlaySupport for showing toast messages or overlays.
        child: CupertinoApp.router(
          debugShowCheckedModeBanner:
              false, // Disables the debug banner for a cleaner UI.
          // Router setup for navigation.
          routeInformationProvider: appRouter.routeInformationProvider,
          routeInformationParser: appRouter.routeInformationParser,
          routerDelegate: appRouter.routerDelegate,
          shortcuts:
              AppShortcuts.defaults, // Keyboard shortcuts for the application.
          locale: locale, // Current locale for the application.
          theme: getThemeData(
              theme), // Apply the current theme to the application.
          localizationsDelegates:
              _getLocalizationsDelegates, // Localization delegates.
          supportedLocales: AppLocalizations
              .supportedLocales, // Supported locales for the application.
        ),
      ),
    );
  }

  // A utility method to consolidate the localization delegates.
  List<LocalizationsDelegate<dynamic>> get _getLocalizationsDelegates {
    return const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
  }
}

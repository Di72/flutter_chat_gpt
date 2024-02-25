import 'package:flutter_chat_gpt/shared/styles/styles.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/temp.dart';

class ScreenPaths {
  static String home = '/';
  static String details = '/details';
}

final GoRouter appRouter = GoRouter(
  initialLocation: ScreenPaths.home,
  routes: <RouteBase>[
    ShellRoute(
      builder: (context, router, navigator) {
        return ChatGptAppScaffold(child: navigator);
      },
      routes: <RouteBase>[
        AppRoute(
          ScreenPaths.home,
          (_) => const ChatListScreen(),
        ),
        AppRoute(
          ScreenPaths.details,
          (_) => const ChatScreen(),
        ),
      ],
    )
  ],
);

class AppRoute extends GoRoute {
  AppRoute(String path, Widget Function(GoRouterState s) page,
      {List<GoRoute> routes = const []})
      : super(
          path: path,
          routes: routes,
          pageBuilder: (context, state) => CupertinoPage(
            child: page(state),
          ),
        );
}

class ChatGptAppScaffold extends ConsumerWidget {
  const ChatGptAppScaffold({super.key, required this.child});
  final Widget child;
  static late AppStyle style;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to the device size, and update AppStyle when it changes

    final mq = MediaQuery.of(context);

    // Set default timing for animations in the app
    // Animate.defaultDuration = _style.times.fast;
    // Create a style object that will be passed down the widget tree

    style = AppStyle(
      screenSize: context.sizePx,
      localeName: AppLocalizations.of(context).localeName,
    );
    return KeyedSubtree(
      key: ValueKey($styles.scale),
      child: DefaultTextStyle(
        style: $styles.text.body,

        // Use a custom scroll behavior across entire app
        child: child,
      ),
    );
  }
}

AppStyle get $styles => ChatGptAppScaffold.style;

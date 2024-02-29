import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_gpt/features/current_chat/presentation/current_chat.dart';
import 'package:flutter_chat_gpt/shared/main/app_scaffold.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/features/list_chat/presentation/list_chat.dart';

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
          (_) => const ListChatScreen(),
        ),
        AppRoute(
          ScreenPaths.details,
          (_) => const CurrentChatScreen(),
        ),
      ],
    )
  ],
);

/// Custom GoRoute sub-class to make the router declaration easier to read
class AppRoute extends GoRoute {
  AppRoute(String path, Widget Function(GoRouterState s) page,
      {List<GoRoute> routes = const []})
      : super(
          path: path,
          routes: routes,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: page(state),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            );
          },
        );
}

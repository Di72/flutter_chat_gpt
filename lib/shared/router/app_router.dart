import 'package:flutter_chat_gpt/features/chat/presentation/screens/chat_screen.dart';
import 'package:flutter_chat_gpt/shared/main/app_scaffold.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/features/dashboard/presentation/screens/dashboard_screen.dart';

class ScreenPaths {
  static String dashboard = '/';
  static String chat(String? id) => '/chat/$id';
}

final GoRouter appRouter = GoRouter(
  initialLocation: ScreenPaths.dashboard,
  routes: <RouteBase>[
    ShellRoute(
      builder: (context, router, navigator) {
        return ChatGptAppScaffold(child: navigator);
      },
      routes: <RouteBase>[
        AppRoute(
          ScreenPaths.dashboard,
          (_) => const DashboardScreen(),
        ),
        AppRoute(
          "/chat/:id",
          (GoRouterState state) => ChatScreen(
            chatId: state.pathParameters["id"],
          ),
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

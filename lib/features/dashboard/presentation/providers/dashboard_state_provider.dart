import 'package:flutter_chat_gpt/features/dashboard/presentation/providers/state/dashboard_notifier.dart';
import 'package:flutter_chat_gpt/features/dashboard/presentation/providers/state/dashboard_state.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';

final dashboardProvider =
    AsyncNotifierProvider<DashboardAsyncNotifier, DashboardState>(
        DashboardAsyncNotifier.new);

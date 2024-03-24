import 'package:flutter_chat_gpt/features/chat/presentation/providers/state/chat_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default([]) List<ChatState> chats,
  }) = _DashboardState;
}

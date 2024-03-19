import 'package:flutter_chat_gpt/features/chat/presentation/providers/state/chat_notifier.dart';
import 'package:flutter_chat_gpt/features/chat/presentation/providers/state/chat_state.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';

final chatProvider =
    AsyncNotifierProvider.autoDispose<ChatAutoDisposeAsyncNotifier, ChatState>(
        ChatAutoDisposeAsyncNotifier.new);

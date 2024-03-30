import 'dart:math' as math show sin, pi;

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_chat_gpt/features/chat/presentation/providers/chat_state_provider.dart';
import 'package:flutter_chat_gpt/features/chat/presentation/providers/state/chat_notifier.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/shared/main/app_scaffold.dart';
import 'package:flutter_chat_gpt/shared/widgets/flexible_sliver_app_bar/flexible_sliver_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

part '../widgets/_chat_input_field.dart';
part '../widgets/_chat_message_list.dart';
part '../widgets/_loader_fading_circle.dart';
part '../widgets/_message_shape.dart';

class ChatScreen extends HookConsumerWidget {
  const ChatScreen({this.chatId, super.key});
  final String? chatId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isNewChat = chatId == NEW_CHAT ? true : false;
    final scrollController = useScrollController();

    final chatState = ref.watch(chatProvider);
    final chatNotifier = ref.read(chatProvider.notifier);

    if (!isNewChat) {
      useEffect(() {
        chatNotifier.setState(chatId!);
        return null;
      }, []);
    }

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: 200.milliseconds,
            curve: Curves.easeOut,
          );
        }
      });
      return null;
    }, [chatState.value?.messages.length]);

    return Stack(
      children: [
        _buildMessageListWithAppBar(
            scrollController, context, isNewChat, chatNotifier),
        _buildChatInputField((msg) => chatNotifier.sendMessage(msg)),
      ],
    );
  }

  Widget _buildChatInputField(Function(String msg) send) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: _ChatInputField(
        send: (msg) => send(msg),
      ),
    );
  }

  Widget _buildMessageListWithAppBar(
      ScrollController scrollController,
      BuildContext context,
      bool isNewChat,
      ChatAutoDisposeAsyncNotifier chatNotifier) {
    return CustomScrollView(
      controller: scrollController,
      slivers: <Widget>[
        FlexibleSliverAppBar(
          leading: IconWrapper(
            onTap: context.pop,
            verticalPadding: 8,
            icon: AppIcons.back,
            color: AppColors.activeGreen,
          ),
          title: isNewChat
              ? AppLocalizations.of(context).newChat
              : AppLocalizations.of(context).chat,
        ),
        _ChatMessageList(),
        SliverToBoxAdapter(
          child: Visibility(
            visible: chatNotifier.isloading,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _LoaderFadingCircle(
                color: AppColors.activeGreen,
                size: $styles.scale * 50.0,
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Gap(
            65,
          ),
        ),
      ],
    );
  }
}

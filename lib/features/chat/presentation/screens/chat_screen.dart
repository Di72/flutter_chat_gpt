import 'dart:math' as math show sin, pi;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_chat_gpt/features/chat/presentation/providers/chat_state_provider.dart';
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
  // Optionally accept a chat ID to determine if this is a new chat or an existing one.
  const ChatScreen({this.chatId, super.key});
  final String? chatId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Determine if this screen is for a new chat based on the chatId.
    final isNewChat = chatId == NEW_CHAT ? true : false;
    // Use a ScrollController for controlling the scroll view programmatically.
    final scrollController = useScrollController();

    // Obtain chat state and notifier from the provider for managing chat state.
    final chatState = ref.watch(chatProvider);
    final chatNotifier = ref.read(chatProvider.notifier);

    // Fetch chat data if this is not a new chat.
    if (!isNewChat) {
      useEffect(() {
        chatNotifier.setState(chatId!);
        return null;
      }, []);
    }

    // Auto-scroll to the bottom of the chat when new messages are added.
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: $styles.times.fast,
            curve: Curves.easeOut,
          );
        }
      });
      return null;
    }, [chatState.value?.messages.length]);

    return Stack(
      children: [
        // Build the main message list and app bar using a custom function for better code organization.
        _buildMessageListWithAppBar(
          context,
          scrollController,
          isNewChat,
          chatNotifier.isloading,
        ),
        // Build the chat input field at the bottom of the screen.
        _buildChatInputField((msg) => chatNotifier.sendMessage(msg)),
      ],
    );
  }

  // Helper method to build the chat input field, abstracting its construction for clarity.
  Widget _buildChatInputField(Function(String msg) send) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: _ChatInputField(
        send: (msg) => send(msg),
      ),
    );
  }

  // Helper method to construct the message list and the app bar, encapsulating the layout and behavior of the chat's main content.
  Widget _buildMessageListWithAppBar(
    BuildContext context,
    ScrollController scrollController,
    bool isNewChat,
    bool isloading,
  ) {
    return CustomScrollView(
      controller: scrollController,
      slivers: <Widget>[
        FlexibleSliverAppBar(
          leading: IconWrapper(
            onTap: context.pop,
            verticalPadding: $styles.insets.xs,
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
            visible: isloading,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _LoaderFadingCircle(
                color: AppColors.activeGreen,
                size: $styles.scale * 50.0,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Gap(
            $styles.insets.offset,
          ),
        ),
      ],
    );
  }
}

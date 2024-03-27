import 'package:feedback_sentry/feedback_sentry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_chat_gpt/features/chat/presentation/providers/chat_state_provider.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/shared/main/app_scaffold.dart';
import 'package:flutter_chat_gpt/shared/widgets/message_shape.dart';
import 'package:flutter_chat_gpt/shared/widgets/navigation_bar/cascading_menu.dart';

import 'package:rive/rive.dart';

class ChatScreen extends HookConsumerWidget {
  const ChatScreen({this.chatId, super.key});
  final String? chatId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isNewChat = chatId == NEW_CHAT ? true : false;
    final textEditingController = useTextEditingController();
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
        CustomScrollView(
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
            SliverPadding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 16, bottom: 64),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final item = chatState.value?.messages[index];
                    if (item?.role == "assistant") {
                      return MessageShape(
                        text: item?.content ?? "",
                        color: AppColors.activeGreen,
                        tail: true,
                        isSender: false,
                        textStyle: TextStyle(
                          color: Colors.white,
                          height: 1,
                        ),
                      ).animate().moveX(
                            duration: 300.milliseconds,
                            end: 0,
                            begin: -1000,
                            curve: Curves.easeIn,
                          );
                    }

                    if (item?.role == "user") {
                      return MessageShape(
                        text: item?.content ?? "",
                        color: CupertinoTheme.of(context).primaryColor,
                        tail: true,
                        textStyle: TextStyle(
                          color: CupertinoTheme.of(context)
                              .primaryContrastingColor,
                          height: 1,
                        ),
                      ).animate().moveX(
                            duration: 300.milliseconds,
                            end: 0,
                            begin: 1000,
                            curve: Curves.easeIn,
                          );
                    }
                    return null;
                  },
                  childCount: chatState.value?.messages.length,
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.only(
              right: 16,
              left: 16,
              top: 4,
              bottom: 8,
            ),
            decoration: BoxDecoration(
              color: CupertinoTheme.of(context)
                  .scaffoldBackgroundColor
                  .withOpacity(0.7),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CupertinoTextField(
                    controller: textEditingController,
                    onSubmitted: (value) {
                      if (value != "") {
                        chatNotifier.sendMessage(textEditingController.text);
                        textEditingController.clear();
                      }
                    },
                    suffix: GestureDetector(
                      onTap: () {
                        chatNotifier.sendMessage(textEditingController.text);
                        textEditingController.clear();
                        FocusScope.of(context).unfocus();
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        margin: EdgeInsets.only(right: 4),
                        decoration: BoxDecoration(
                          color: AppColors.secondarySystemFill,
                          shape: BoxShape.circle,
                        ),
                        child: RiveAnimation.asset(RivePaths.gptLogo),
                      ).animate().fade(),
                    ),
                    suffixMode: OverlayVisibilityMode.editing,
                    cursorColor:
                        CupertinoTheme.of(context).primaryContrastingColor,
                    placeholder: "Text Message",
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: AppColors.secondarySystemFill),
                      color: CupertinoTheme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(0.7),
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FlexibleSliverAppBar extends StatelessWidget {
  const FlexibleSliverAppBar({
    super.key,
    required this.title,
    this.leading,
  });

  final Widget? leading;
  final String title;

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverNavigationBar(
      border: null,
      stretch: true,
      backgroundColor: Colors.transparent,
      leading: leading,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconWrapper(
            onTap: () => BetterFeedback.of(context).showAndUploadToSentry(
              name: 'Feedback',
              email: 'pro100st111m@gmail.com',
            ),
            verticalPadding: 8,
            icon: AppIcons.pencilEllipsisRectangle,
            color: AppColors.activeGreen,
          ),
          const SizedBox(width: 16),
          const CascadingMenu()
        ],
      ),
      largeTitle: Text(title),
    );
  }
}

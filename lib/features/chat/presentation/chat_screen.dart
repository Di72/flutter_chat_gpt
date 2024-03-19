import 'package:feedback_sentry/feedback_sentry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_chat_gpt/features/chat/presentation/providers/chat_state_provider.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/shared/widgets/navigation_bar/cascading_menu.dart';

import 'package:rive/rive.dart';

class ChatScreen extends HookConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textEditingController = useTextEditingController();
    final chatState = ref.watch(chatProvider);
    final chatNotifier = ref.read(chatProvider.notifier);
    return Stack(
      children: [
        CustomScrollView(
          slivers: <Widget>[
            FlexibleSliverAppBar(
              leading: ButtonWrapper(
                onTap: context.pop,
                child: const Icon(
                  AppIcons.back,
                  color: AppColors.activeGreen,
                  size: 22,
                ),
              ),
              title: AppLocalizations.of(context).newChat,
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final item = chatState.value?.messages[index];
                    if (item?.role == "assistant") {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 4),
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: AppColors.activeGreen,
                          borderRadius: BorderRadius.all(
                            const Radius.circular(12),
                          ),
                        ),
                        child: Text(
                          item?.content ?? "",
                          style: TextStyle(color: AppColors.white),
                        ),
                      );
                    }

                    if (item?.role == "user") {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 4),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: CupertinoTheme.of(context).primaryColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Text(item?.content ?? "",
                            style: TextStyle(
                                color: CupertinoTheme.of(context)
                                    .primaryContrastingColor)),
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
                      chatNotifier.sendMessage(value);
                      textEditingController.clear();
                    },
                    suffix: GestureDetector(
                      onTap: () {
                        chatNotifier.sendMessage(textEditingController.text);
                        textEditingController.clear();
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
          GestureDetector(
            onTap: () {
              BetterFeedback.of(context).showAndUploadToSentry(
                name: 'Feedback',
                email: 'pro100st111m@gmail.com',
              );
            },
            child: const Icon(
              CupertinoIcons.pencil_ellipsis_rectangle,
              color: CupertinoColors.activeGreen,
              size: 26,
            ),
          ),
          const SizedBox(width: 16),
          const CascadingMenu()
        ],
      ),
      largeTitle: Text(title),
    );
  }
}

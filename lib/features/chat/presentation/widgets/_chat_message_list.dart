part of '../screens/chat_screen.dart';

class _ChatMessageList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatState = ref.watch(chatProvider);
    return SliverPadding(
      padding: EdgeInsets.only(
        left: $styles.insets.md,
        right: $styles.insets.md,
        top: $styles.insets.md,
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final item = chatState.value?.messages[index];
            if (item?.role == "assistant") {
              return _MessageShape(
                text: item?.content ?? "",
                color: AppColors.activeGreen,
                tail: true,
                isSender: false,
                textStyle: const TextStyle(
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
              return _MessageShape(
                text: item?.content ?? "",
                color: CupertinoTheme.of(context).primaryColor,
                tail: true,
                textStyle: TextStyle(
                  color: CupertinoTheme.of(context).primaryContrastingColor,
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
    );
  }
}

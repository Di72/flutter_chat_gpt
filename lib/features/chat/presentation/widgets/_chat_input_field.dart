part of '../screens/chat_screen.dart';

class _ChatInputField extends HookWidget {
  _ChatInputField({
    required this.send,
  });

  final textEditingController = useTextEditingController();

  final Function(String msg) send;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: $styles.insets.md,
        left: $styles.insets.md,
        top: $styles.insets.xxs,
        bottom: $styles.insets.xs,
      ),
      decoration: BoxDecoration(
        color:
            CupertinoTheme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: CupertinoTextField(
              controller: textEditingController,
              onSubmitted: (value) {
                if (value != "") {
                  send(textEditingController.text);
                  textEditingController.clear();
                }
              },
              suffix: GestureDetector(
                onTap: () {
                  send(textEditingController.text);
                  textEditingController.clear();
                  FocusScope.of(context).unfocus();
                },
                child: Container(
                  height: 30,
                  width: 30,
                  margin: EdgeInsets.only(right: $styles.insets.xxs),
                  decoration: const BoxDecoration(
                    color: AppColors.secondarySystemFill,
                    shape: BoxShape.circle,
                  ),
                  child: RiveAnimation.asset(RivePaths.gptLogo),
                ).animate().fade(),
              ),
              suffixMode: OverlayVisibilityMode.editing,
              cursorColor: CupertinoTheme.of(context).primaryContrastingColor,
              placeholder: "Text Message",
              padding: EdgeInsets.symmetric(
                horizontal: $styles.insets.sm,
                vertical: $styles.insets.xs,
              ),
              decoration: BoxDecoration(
                border:
                    Border.all(width: 1, color: AppColors.secondarySystemFill),
                color: CupertinoTheme.of(context)
                    .scaffoldBackgroundColor
                    .withOpacity(0.7),
                borderRadius: BorderRadius.circular($styles.corners.md),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

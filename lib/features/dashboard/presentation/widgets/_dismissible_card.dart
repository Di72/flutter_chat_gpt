part of '../screens/dashboard_screen.dart';

class _DismissibleCard extends StatelessWidget {
  const _DismissibleCard({
    required this.item,
    required this.index,
    required this.length,
    required this.date,
    required this.forwardAnimation,
  });

  final ChatState item;
  final int index;
  final int length;
  final DateTime date;
  final Function() forwardAnimation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        forwardAnimation();
        context.push(ScreenPaths.chat(item.id));
      },
      child: Container(
        padding: EdgeInsets.only(
          left: $styles.insets.lg,
          bottom: $styles.insets.sm,
          top: $styles.insets.sm,
          right: $styles.insets.xxs,
        ),
        margin: EdgeInsets.only(bottom: $styles.insets.xxs),
        decoration: BoxDecoration(
          color: CupertinoTheme.of(context).primaryColor,
          borderRadius: _getBorderRadius(index, length),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.messages.last.content,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  height: 1,
                  color: CupertinoTheme.of(context).primaryContrastingColor),
            ),
            Gap($styles.insets.xxs),
            Text(
              "${DateFormat.Md().format(date)} ${DateFormat.Hms().format(date)}",
              style: const TextStyle(
                color: AppColors.systemGrey2,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

BorderRadius? _getBorderRadius(int index, int length) {
  if (index == 0 && index == length - 1) {
    return const BorderRadius.all(Radius.circular(12));
  }
  if (index == 0) {
    return const BorderRadius.only(
      topLeft: Radius.circular(12),
      topRight: Radius.circular(12),
    );
  }
  if (index == length - 1) {
    return const BorderRadius.only(
      bottomLeft: Radius.circular(12),
      bottomRight: Radius.circular(12),
    );
  }
  return null;
}

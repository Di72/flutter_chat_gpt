part of '../flexible_sliver_app_bar.dart';

class _MenuItemButtonWithCheckMark extends StatelessWidget {
  const _MenuItemButtonWithCheckMark(
    this.title, {
    this.onPressed,
    this.isShowMark = false,
  });

  final bool isShowMark;
  final String? title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return custom.MenuItemButton(
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.only(
          top: $styles.insets.xxs,
          bottom: $styles.insets.xxs,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            isShowMark
                ? const Icon(
                    AppIcons.checkmarkAlt,
                    color: AppColors.white,
                  )
                : Gap($styles.insets.md),
            Gap($styles.insets.xs),
            Text(
              title ?? "",
              style: const TextStyle(color: AppColors.white),
            ),
            Gap($styles.insets.xxs),
          ],
        ),
      ),
    );
  }
}

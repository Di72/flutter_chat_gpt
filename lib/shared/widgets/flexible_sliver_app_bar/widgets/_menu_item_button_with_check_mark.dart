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
        padding: const EdgeInsets.only(
          top: 4,
          bottom: 4,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            isShowMark
                ? const Icon(
                    AppIcons.checkmarkAlt,
                    color: AppColors.white,
                  )
                : const Gap(24),
            const Gap(6),
            Text(
              title ?? "",
              style: const TextStyle(color: AppColors.white),
            ),
            const Gap(4),
          ],
        ),
      ),
    );
  }
}

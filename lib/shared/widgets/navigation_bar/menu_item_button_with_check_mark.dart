import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/shared/widgets/custom_widgets/menu_anchor_custom.dart'
    as custom;

class MenuItemButtonWithCheckMark extends StatelessWidget {
  const MenuItemButtonWithCheckMark(
    this.title, {
    super.key,
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
                ? Icon(
                    AppIcons.checkmarkAlt,
                    color: AppColors.white,
                  )
                : Gap(24),
            Gap(6),
            Text(
              title ?? "",
              style: TextStyle(color: AppColors.white),
            ),
            Gap(4),
          ],
        ),
      ),
    );
  }
}

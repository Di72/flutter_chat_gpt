import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/shared/widgets/custom_widgets/menu_anchor_custom.dart'
    as custom;

class CascadingMenuCard extends StatelessWidget {
  const CascadingMenuCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.cardChildren,
  });

  final String title;
  final String subTitle;
  final IconData icon;
  final List<Widget> cardChildren;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.secondarySystemFill, width: 1),
        ),
      ),
      child: custom.SubmenuButton(
        trailingIcon: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Icon(icon, color: AppColors.white),
        ),
        alignmentOffset: const Offset(0, 8),
        menuStyle: MenuStyle(
          shadowColor: MaterialStateProperty.all(AppColors.black),
          backgroundColor: MaterialStateProperty.all(
            AppColors.semiBlack.withOpacity(0.85),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        menuChildren: cardChildren,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 12,
            right: 50,
            left: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: AppColors.white),
              ),
              Text(
                subTitle,
                style:
                    const TextStyle(color: AppColors.systemGrey2, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

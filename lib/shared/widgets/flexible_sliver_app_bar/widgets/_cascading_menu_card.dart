part of '../flexible_sliver_app_bar.dart';

class _CascadingMenuCard extends StatelessWidget {
  const _CascadingMenuCard({
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
    return custom.SubmenuButton(
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
    );
  }
}

import 'package:feedback_sentry/feedback_sentry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_gpt/core/data/localization/localization_service.dart';
import 'package:flutter_chat_gpt/core/data/theme/theme_service.dart';
import 'package:flutter_chat_gpt/core/domain/providers/localization_provider.dart';
import 'package:flutter_chat_gpt/core/domain/providers/theme_provider.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/shared/widgets/custom_widgets/menu_anchor_custom.dart'
    as custom;

part 'widgets/_cascading_menu.dart';
part 'widgets/_cascading_menu_card.dart';
part 'widgets/_menu_item_button_with_check_mark.dart';

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
          _CascadingMenu()
        ],
      ),
      largeTitle: Text(title),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/shared/widgets/navigation_bar/cascading_menu.dart';

class CurrentChatScreen extends ConsumerWidget {
  const CurrentChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              stretch: true,
              backgroundColor: CupertinoTheme.of(context)
                  .scaffoldBackgroundColor
                  .withOpacity(0.2),
              leading: ButtonWrapper(
                onTap: context.pop,
                child: const Icon(
                  AppIcons.back,
                  color: AppColors.activeGreen,
                  size: 22,
                ),
              ),
              trailing: const CascadingMenu(),
              largeTitle: Text(AppLocalizations.of(context).english),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';

import 'package:flutter_chat_gpt/shared/widgets/navigation_bar/cascading_menu.dart';
import 'package:rive/rive.dart';

class ListChatScreen extends HookWidget {
  const ListChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final animationController =
        useAnimationController(duration: 200.milliseconds);

    return Stack(
      children: [
        CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              stretch: true,
              backgroundColor: CupertinoTheme.of(context)
                  .scaffoldBackgroundColor
                  .withOpacity(0.2),
              leading: const Icon(
                AppIcons.back,
                color: AppColors.activeGreen,
                size: 22,
              ),
              largeTitle: Text(AppLocalizations.of(context).notes),
              trailing: const CascadingMenu(),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ButtonWrapper(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.darkBackgroundGray,
                            borderRadius: BorderRadius.circular(12)),
                        height: 60,
                        child: Text(AppLocalizations.of(context).system),
                      ),
                    ),
                  ),
                  const Gap(16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ButtonWrapper(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.darkBackgroundGray,
                            borderRadius: BorderRadius.circular(12)),
                        height: 60,
                        child: Text(AppLocalizations.of(context).system),
                      ),
                    ),
                  ),
                  const Gap(16),
                ],
              ),
            ),
          ],
        )
            .animate(
              controller: animationController,
              autoPlay: false,
              onComplete: (controller) => Future.delayed(300.milliseconds)
                  .then((val) => controller.reverse()),
            )
            .fadeOut(duration: 200.milliseconds),
        Positioned(
          bottom: 110,
          right: 120,
          child: ButtonWrapper(
            onTap: () {
              animationController.forward();
              context.push(ScreenPaths.details);
            },
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: CupertinoTheme.of(context).scaffoldBackgroundColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: RiveAnimation.asset(RivePaths.gptLogo),
              ),
            ),
          ),
        )
            .animate(
              controller: animationController,
              autoPlay: false,
              onComplete: (controller) => Future.delayed(300.milliseconds)
                  .then((val) => controller.reverse()),
            )
            .fadeOut(duration: 200.milliseconds),
      ],
    );
  }
}

part of '../screens/dashboard_screen.dart';

class _FloatingActionGptButton extends StatelessWidget {
  const _FloatingActionGptButton({
    required this.forwardAnimation,
  });

  final Function() forwardAnimation;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        forwardAnimation();
        context.push(ScreenPaths.chat(NEW_CHAT));
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
          padding: EdgeInsets.all($styles.insets.md),
          child: RiveAnimation.asset(RivePaths.gptLogo),
        ),
      ),
    );
  }
}

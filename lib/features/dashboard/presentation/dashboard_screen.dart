import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_chat_gpt/features/chat/presentation/chat_screen.dart';
import 'package:flutter_chat_gpt/features/chat/presentation/providers/state/chat_state.dart';
import 'package:flutter_chat_gpt/features/dashboard/presentation/providers/dashboard_state_provider.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:intl/intl.dart';
import 'package:rive/rive.dart';

class DashboardScreen extends HookConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationController = useAnimationController();

    final dashboardNotifier = ref.read(dashboardProvider.notifier);
    final dashboardState = ref.watch(dashboardProvider);
    List<ChatState>? chats = dashboardState.value?.chats;

    useEffect(() {
      dashboardNotifier.watchChats();
      return null;
    }, []);
    return Stack(
      children: [
        CustomScrollView(
          slivers: <Widget>[
            FlexibleSliverAppBar(
              title: AppLocalizations.of(context).chats,
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: chats != null
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final item = chats![index];
                          return Dismissible(
                            direction: DismissDirection.endToStart,
                            key: Key(item.id),
                            onDismissed: (direction) async {
                              await dashboardNotifier.deleteChat(item.id);
                              chats = List.from(chats!.toList())
                                ..removeAt(index);
                            },
                            background: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    _getBorderRadius(index, chats!.length),
                                color: Colors.red,
                              ),
                              child: const Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 28),
                                  child: Icon(
                                    AppIcons.trashFill,
                                    color: AppColors.white,
                                    size: 28,
                                  ),
                                ),
                              ),
                            ),
                            child: DismissibleCard(
                              item: item,
                              index: index,
                              length: chats!.length,
                              date: item.date!,
                              forwardAnimation: animationController.forward,
                            ),
                          );
                        },
                        childCount: chats.length,
                      ),
                    )
                  : null,
            ),
          ],
        ),
        Positioned(
          bottom: 110,
          right: 70,
          child: InkWell(
            onTap: () {
              animationController.forward();
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
                padding: const EdgeInsets.all(15),
                child: RiveAnimation.asset(RivePaths.gptLogo),
              ),
            ),
          ),
        ),
      ],
    )
        .animate(
          controller: animationController,
          autoPlay: false,
          onComplete: (controller) => controller.reverse(),
        )
        .moveX(
          duration: 400.milliseconds,
          end: 300,
          curve: Curves.easeIn,
        )
        .fadeOut();
  }
}

class DismissibleCard extends StatelessWidget {
  const DismissibleCard({
    super.key,
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
        padding: const EdgeInsets.only(
          left: 24,
          bottom: 12,
          top: 12,
          right: 4,
        ),
        margin: const EdgeInsets.only(bottom: 2),
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
            const Gap(4),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';

import 'package:flutter_chat_gpt/shared/widgets/navigation_bar/cascading_menu.dart';
import 'package:intl/intl.dart';
import 'package:rive/rive.dart';

class ListChatScreen extends HookWidget {
  const ListChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController();
    final items = useState(List<Map<String, DateTime>>.generate(
        100, (index) => {'Chat $index': DateTime.now()}));

    return Stack(
      children: [
        CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              stretch: true,
              backgroundColor: CupertinoTheme.of(context)
                  .scaffoldBackgroundColor
                  .withOpacity(0.2),
              largeTitle: Text(AppLocalizations.of(context).notes),
              trailing: const CascadingMenu(),
            ),
            SliverPadding(
              padding: EdgeInsets.all(20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final item = items.value[index];
                    return Dismissible(
                      direction: DismissDirection.endToStart,
                      key: Key(item.keys.first),
                      onDismissed: (direction) {
                        items.value = List.from(items.value)..removeAt(index);
                      },
                      background: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              _getBorderRadius(index, items.value.length),
                          color: Colors.red,
                        ),
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 28),
                            child: Icon(
                              AppIcons.trash,
                              color: AppColors.white,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                      child: DismissibleCard(
                        item: item,
                        index: index,
                        length: items.value.length,
                      ),
                    );
                  },
                  childCount: items.value.length,
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 110,
          right: 70,
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
  });

  final Map<String, DateTime> item;
  final int index;
  final int length;

  @override
  Widget build(BuildContext context) {
    bool isNotLastItem = index != length - 1;

    return Container(
      padding: const EdgeInsets.only(
        left: 24,
        bottom: 12,
        top: 12,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: _getBorderRadius(index, length),
        border: isNotLastItem
            ? const Border(
                bottom:
                    BorderSide(color: AppColors.secondarySystemFill, width: 1),
              )
            : null,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.keys.first, style: const TextStyle(height: 1)),
          const Gap(4),
          Text(
            DateFormat.yMEd().format(item.values.first),
            style: const TextStyle(
              color: AppColors.systemGrey2,
              height: 1,
            ),
          ),
        ],
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

part of '../screens/dashboard_screen.dart';

class _ChatListWithDismiss extends HookConsumerWidget {
  const _ChatListWithDismiss({required this.forwardAnimation});

  final Function() forwardAnimation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardNotifier = ref.read(dashboardProvider.notifier);
    final dashboardState = ref.watch(dashboardProvider);
    List<ChatState>? chats = dashboardState.value?.chats;

    useEffect(() {
      dashboardNotifier.watchChats();
      return null;
    }, []);
    return SliverPadding(
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
                      chats = List.from(chats!.toList())..removeAt(index);
                    },
                    background: Container(
                      decoration: BoxDecoration(
                        borderRadius: _getBorderRadius(index, chats!.length),
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
                    child: _DismissibleCard(
                      item: item,
                      index: index,
                      length: chats!.length,
                      date: item.date!,
                      forwardAnimation: forwardAnimation,
                    ),
                  );
                },
                childCount: chats.length,
              ),
            )
          : null,
    );
  }
}

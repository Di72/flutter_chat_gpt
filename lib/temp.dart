import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/core/domain/providers/theme_provider.dart';
import 'package:rive/rive.dart';
import 'package:flutter_chat_gpt/shared/widgets/custom_widgets/menu_anchor_custom.dart'
    as custom;

class ChatListScreen extends ConsumerWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // void handlePressed() => context.push(ScreenPaths.details);
    final themeNotifier = ref.read(themeProvider.notifier);

    return CupertinoPageScaffold(
      child: Stack(
        children: [
          RiveAnimation.asset(RivePaths.gptLogo),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: const SizedBox(),
            ),
          ),
          CustomScrollView(
            slivers: <Widget>[
              CupertinoSliverNavigationBar(
                backgroundColor: CupertinoTheme.of(context)
                    .scaffoldBackgroundColor
                    .withOpacity(0.2),
                leading: const Icon(
                  AppIcons.back,
                  color: AppColors.activeGreen,
                  size: 22,
                ),
                largeTitle: Text(AppLocalizations.of(context).notes),
                trailing: CascadingMenu(),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ButtonWrapper(
                      onTap: () => themeNotifier.setTheme(ThemeMode.system),
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
                ]),
              ),
            ],
          ),
          Positioned(
            bottom: 110,
            right: 120,
            child: ButtonWrapper(
              onTap: () => themeNotifier.setTheme(ThemeMode.dark),
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
                  padding: EdgeInsets.all(15),
                  child: RiveAnimation.asset(RivePaths.gptLogo),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CascadingMenu extends ConsumerWidget {
  bool isOpen = false;

  CascadingMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeProvider.notifier);
    return Column(
      children: <Widget>[
        custom.MenuAnchor(
          alignmentOffset: Offset(0, 12),
          onOpen: () {
            isOpen = true;
          },
          onClose: () {
            isOpen = false;
          },
          style: MenuStyle(
            backgroundColor: MaterialStateProperty.all(
              Color(0xFF2C2C2E).withOpacity(0.85),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          menuChildren: <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: AppColors.secondarySystemFill, width: 1),
                ),
              ),
              child: custom.SubmenuButton(
                trailingIcon: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(AppIcons.textAlignleft, color: AppColors.white),
                ),
                alignmentOffset: Offset(0, 8),
                menuStyle: MenuStyle(
                    shadowColor: MaterialStateProperty.all(AppColors.black),
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xFF2C2C2E).withOpacity(0.85),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    )),
                menuChildren: <Widget>[
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: AppColors.secondarySystemFill, width: 1),
                      ),
                    ),
                    child: custom.MenuItemButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 4,
                          bottom: 4,
                        ),
                        child: Row(
                          children: [
                            true
                                ? Icon(
                                    AppIcons.checkmarkAlt,
                                    color: AppColors.white,
                                  )
                                : Gap(4),
                            Gap(6),
                            Text(
                              AppLocalizations.of(context).english,
                              style: TextStyle(color: AppColors.white),
                            ),
                            Gap(4),
                          ],
                        ),
                      ),
                    ),
                  ),
                  custom.MenuItemButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 4,
                        bottom: 4,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          false
                              ? Icon(
                                  AppIcons.checkmarkAlt,
                                  color: AppColors.white,
                                )
                              : Gap(24),
                          Gap(6),
                          Text(
                            AppLocalizations.of(context).russian,
                            style: TextStyle(color: AppColors.white),
                          ),
                          Gap(4),
                        ],
                      ),
                    ),
                  ),
                ],
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
                        AppLocalizations.of(context).language,
                        style: TextStyle(color: AppColors.white),
                      ),
                      Text(
                        AppLocalizations.of(context).english,
                        style: TextStyle(
                            color: AppColors.systemGrey2, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            custom.SubmenuButton(
              trailingIcon: Padding(
                padding: const EdgeInsets.only(right: 8),
                child:
                    Icon(AppIcons.circleLefthalfFill, color: AppColors.white),
              ),
              alignmentOffset: Offset(0, 8),
              menuStyle: MenuStyle(
                shadowColor: MaterialStateProperty.all(AppColors.black),
                backgroundColor: MaterialStateProperty.all(
                  Color(0xFF2C2C2E).withOpacity(0.85),
                ),
              ),
              menuChildren: <Widget>[
                custom.MenuItemButton(
                  onPressed: () => themeNotifier.setTheme(ThemeMode.system),
                  child: Text(
                    ThemeMode.system.toString(),
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
                custom.MenuItemButton(
                  onPressed: () => themeNotifier.setTheme(ThemeMode.dark),
                  child: Text(
                    ThemeMode.dark.toString(),
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
                custom.MenuItemButton(
                  onPressed: () => themeNotifier.setTheme(ThemeMode.light),
                  child: Text(
                    ThemeMode.light.toString(),
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ],
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  bottom: 12,
                  right: 50,
                  left: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context).theme,
                      style: TextStyle(color: AppColors.white),
                    ),
                    Text(
                      AppLocalizations.of(context).dark,
                      style:
                          TextStyle(color: AppColors.systemGrey2, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          ],
          builder: (BuildContext context, custom.MenuController controller,
              Widget? child) {
            return GestureDetector(
              onTap: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Icon(
                  AppIcons.ellipsisCircle,
                  size: 22,
                  color: isOpen
                      ? AppColors.activeGreen.withOpacity(.2)
                      : AppColors.activeGreen,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

/// {@template app.app}
/// ChatScreen widget
/// {@endtemplate}
class ChatScreen extends StatefulWidget {
  /// {@macro app.app}
  const ChatScreen({
    Key? key,
  }) : super(key: key);

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.

  @override
  State<ChatScreen> createState() => _ChatScreenState();
} // ChatScreen

/// State for widget ChatScreen
class _ChatScreenState extends State<ChatScreen> {
  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // Initial state initialization
  }

  @override
  void didUpdateWidget(ChatScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Widget configuration changed
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // The configuration of InheritedWidgets has changed
    // Also called after initState but before build
  }

  @override
  void dispose() {
    // Permanent removal of a tree stent
    super.dispose();
  }
  /* #endregion */

  @override
  Widget build(BuildContext context) => const Placeholder();
} // _ChatScreenState



import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/shared/styles/styles.dart';
import 'package:rive/rive.dart';

class ChatGptAppScaffold extends ConsumerWidget {
  const ChatGptAppScaffold({super.key, required this.child});
  final Widget child;
  static late AppStyle style;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Create a style object that will be passed down the widget tree
    style = AppStyle(
      screenSize: context.sizePx,
      localeName: AppLocalizations.of(context).localeName,
    );
    return KeyedSubtree(
      key: ValueKey($styles.scale),
      child: DefaultTextStyle(
        style: $styles.text.body,
        // Use a Rive background for different pages
        child: CupertinoPageScaffold(
          resizeToAvoidBottomInset: true,
          child: Stack(
            children: [
              RiveAnimation.asset(RivePaths.background, fit: BoxFit.fill),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: const SizedBox(),
                ),
              ),
              child
            ],
          ),
        ),
      ),
    );
  }
}

AppStyle get $styles => ChatGptAppScaffold.style;

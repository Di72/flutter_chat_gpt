import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:overlay_support/overlay_support.dart';

class AppNotification extends StatelessWidget {
  const AppNotification({
    super.key,
    required this.child,
  });

  factory AppNotification.error(
    BuildContext context,
    String text,
  ) =>
      AppNotification(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 12,
            left: 12,
            right: 12,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: CupertinoTheme.of(context).primaryContrastingColor,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              const Center(
                child: Icon(
                  CupertinoIcons.exclamationmark_circle_fill,
                  size: 32,
                  color: CupertinoColors.systemRed,
                ),
              ),
            ],
          ),
        ),
      );

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8,
          left: 16,
          right: 16,
        ),
        child: SafeArea(
            bottom: false,
            child: SlideDismissible(
              key: ValueKey(key),
              direction: DismissDirection.up,
              child: _buildContent(context),
            )),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            color: CupertinoTheme.of(context)
                .scaffoldBackgroundColor
                .withOpacity(0.7),
            borderRadius: BorderRadius.circular(10),
          ),
          child: child,
        ),
      ),
    );
  }
}

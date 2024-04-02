import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/shared/main/app_scaffold.dart';
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
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: CupertinoColors.systemRed, width: 2),
            color: CupertinoTheme.of(context)
                .scaffoldBackgroundColor
                .withOpacity(0.7),
            borderRadius: BorderRadius.circular($styles.corners.xs),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: $styles.insets.sm,
              bottom: $styles.insets.sm,
              left: $styles.insets.sm,
              right: $styles.insets.sm,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: CupertinoTheme.of(context).primaryContrastingColor,
                      fontSize: $styles.scale * 14,
                    ),
                  ),
                ),
                Gap($styles.insets.xs),
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
        ),
      );

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(
          top: $styles.insets.xs,
          left: $styles.insets.md,
          right: $styles.insets.md,
        ),
        child: SafeArea(
          bottom: false,
          child: SlideDismissible(
            key: ValueKey(key),
            direction: DismissDirection.up,
            child: _buildContent(context),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular($styles.corners.xs),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: child,
      ),
    );
  }
}

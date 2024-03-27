import 'package:flutter/material.dart';
import 'package:flutter_chat_gpt/shared/main/app_scaffold.dart';

class IconWrapper extends StatelessWidget {
  const IconWrapper({
    super.key,
    required this.icon,
    required this.color,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    this.onTap,
  });

  final double horizontalPadding;
  final double verticalPadding;
  final IconData icon;
  final Color color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
          top: verticalPadding,
          bottom: verticalPadding,
          right: horizontalPadding,
          left: horizontalPadding,
        ),
        color: Colors.transparent,
        child: Icon(
          icon,
          color: color,
          size: $styles.scale * 30,
        ),
      ),
    );
  }
}

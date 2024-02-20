import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWrapper extends StatelessWidget {
  const ButtonWrapper({
    super.key,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    required this.child,
    required this.onTap,
  });

  final double horizontalPadding;
  final double verticalPadding;
  final Widget child;
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
        child: child,
      ),
    );
  }
}

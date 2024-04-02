// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_chat_gpt/shared/commom_libs.dart';

class AppStyle {
  AppStyle({
    Size? screenSize,
  }) {
    if (screenSize == null) {
      scale = 1;
      return;
    }
    final shortestSide = screenSize.shortestSide;
    const tabletXl = 1000;
    const tabletLg = 800;
    const tabletSm = 600;
    const phoneLg = 400;
    if (shortestSide > tabletXl) {
      scale = 1.25;
    } else if (shortestSide > tabletLg) {
      scale = 1.15;
    } else if (shortestSide > tabletSm) {
      scale = 1;
    } else if (shortestSide > phoneLg) {
      scale = .9; // phone
    } else {
      scale = .85; // small phone
    }
  }

  late final double scale;

  /// Text styles
  late final _Text text = _Text(scale);

  /// Shared sizes
  late final _Sizes sizes = _Sizes();

  /// Padding and margin values
  late final _Insets insets = _Insets(scale);

  /// Animation Durations
  final _Times times = _Times();

  /// Rounded edge corner radii
  late final _Corners corners = _Corners();
}

@immutable
class _Text {
  _Text(this._scale);
  final double _scale;

  late final TextStyle title1 = _createFont(
    const TextStyle(fontFamily: 'Golos'),
    sizePx: 16,
    heightPx: 26,
    spacingPc: 5,
  );
  late final TextStyle title2 = _createFont(
    const TextStyle(fontFamily: 'Golos'),
    sizePx: 14,
    heightPx: 16.38,
  );

  late final TextStyle body = _createFont(
    const TextStyle(fontFamily: 'Golos'),
    sizePx: 16,
    heightPx: 26,
  );
  late final TextStyle bodyBold = _createFont(
    const TextStyle(fontFamily: 'Golos'),
    sizePx: 16,
    heightPx: 26,
    weight: FontWeight.w600,
  );
  late final TextStyle bodySmall = _createFont(
    const TextStyle(fontFamily: 'Golos'),
    sizePx: 14,
    heightPx: 23,
  );
  late final TextStyle bodySmallBold = _createFont(
    const TextStyle(fontFamily: 'Golos'),
    sizePx: 14,
    heightPx: 23,
    weight: FontWeight.w600,
  );

  TextStyle _createFont(TextStyle style,
      {required double sizePx,
      double? heightPx,
      double? spacingPc,
      FontWeight? weight}) {
    sizePx *= _scale;
    if (heightPx != null) {
      heightPx *= _scale;
    }
    return style.copyWith(
      fontSize: sizePx,
      height: heightPx != null ? (heightPx / sizePx) : style.height,
      letterSpacing:
          spacingPc != null ? sizePx * spacingPc * 0.01 : style.letterSpacing,
      fontWeight: weight,
    );
  }
}

@immutable
class _Times {
  final Duration fast = const Duration(milliseconds: 200);
  final Duration med = const Duration(milliseconds: 400);
  final Duration slow = const Duration(milliseconds: 600);
  final Duration pageTransition = const Duration(milliseconds: 200);
}

@immutable
class _Sizes {
  double get maxContentWidth1 => 800;
  double get maxContentWidth2 => 600;
  double get maxContentWidth3 => 500;
  final Size minAppSize = const Size(380, 650);
}

@immutable
class _Corners {
  late final double xs = 10;
  late final double sm = 12;
  late final double md = 18;
}

@immutable
class _Insets {
  _Insets(this._scale);
  final double _scale;

  late final double xxs = 4 * _scale;
  late final double xs = 8 * _scale;
  late final double sm = 12 * _scale;
  late final double md = 16 * _scale;
  late final double lg = 24 * _scale;
  late final double xl = 32 * _scale;
  late final double xxl = 56 * _scale;
  late final double offset = 80 * _scale;
}

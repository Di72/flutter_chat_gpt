import 'dart:ui';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';

export 'colors.dart';

class AppStyle {
  AppStyle({
    Size? screenSize,
    String? localeName,
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
  String? localeName;

  /// The current theme colors for the app
  final AppColors colors = AppColors();

  /// Text styles
  late final _Text text = _Text(scale, localeName);

  /// Shared sizes
  late final _Sizes sizes = _Sizes();

  /// Padding and margin values
  late final _Insets insets = _Insets(scale);

  /// Animation Durations
  final _Times times = _Times();
}

@immutable
class _Text {
  _Text(this._scale, this._localeName);
  final double _scale;
  final String? _localeName;

  final Map<String, TextStyle> _titleFonts = {
    'en': const TextStyle(fontFamily: 'Tenor'),
  };

  final Map<String, TextStyle> _monoTitleFonts = {
    'en': const TextStyle(fontFamily: 'B612Mono'),
  };

  final Map<String, TextStyle> _quoteFonts = {
    'en': const TextStyle(fontFamily: 'Cinzel'),
    'zh': const TextStyle(fontFamily: 'MaShanZheng'),
  };

  final Map<String, TextStyle> _wonderTitleFonts = {
    'en': const TextStyle(fontFamily: 'Yeseva'),
  };

  final Map<String, TextStyle> _contentFonts = {
    'en': const TextStyle(fontFamily: 'Raleway', fontFeatures: [
      FontFeature.enable('kern'),
    ]),
  };

  TextStyle _getFontForLocale(Map<String, TextStyle> fonts) {
    if (_localeName != null) {
      return fonts.entries
          .firstWhere((x) => x.key == _localeName,
              orElse: () => fonts.entries.first)
          .value;
    } else {
      return fonts.entries.first.value;
    }
  }

  TextStyle get titleFont => _getFontForLocale(_titleFonts);
  TextStyle get quoteFont => _getFontForLocale(_quoteFonts);
  TextStyle get wonderTitleFont => _getFontForLocale(_wonderTitleFonts);
  TextStyle get contentFont => _getFontForLocale(_contentFonts);
  TextStyle get monoTitleFont => _getFontForLocale(_monoTitleFonts);

  late final TextStyle dropCase =
      _createFont(quoteFont, sizePx: 56, heightPx: 20);

  late final TextStyle wonderTitle =
      _createFont(wonderTitleFont, sizePx: 64, heightPx: 56);

  late final TextStyle h1 = _createFont(titleFont, sizePx: 64, heightPx: 62);
  late final TextStyle h2 = _createFont(titleFont, sizePx: 32, heightPx: 46);
  late final TextStyle h3 =
      _createFont(titleFont, sizePx: 24, heightPx: 36, weight: FontWeight.w600);
  late final TextStyle h4 = _createFont(contentFont,
      sizePx: 14, heightPx: 23, spacingPc: 5, weight: FontWeight.w600);

  late final TextStyle title1 =
      _createFont(titleFont, sizePx: 16, heightPx: 26, spacingPc: 5);
  late final TextStyle title2 =
      _createFont(titleFont, sizePx: 14, heightPx: 16.38);

  late final TextStyle body =
      _createFont(contentFont, sizePx: 16, heightPx: 26);
  late final TextStyle bodyBold = _createFont(contentFont,
      sizePx: 16, heightPx: 26, weight: FontWeight.w600);
  late final TextStyle bodySmall =
      _createFont(contentFont, sizePx: 14, heightPx: 23);
  late final TextStyle bodySmallBold = _createFont(contentFont,
      sizePx: 14, heightPx: 23, weight: FontWeight.w600);

  late final TextStyle quote1 = _createFont(quoteFont,
      sizePx: 32, heightPx: 40, weight: FontWeight.w600, spacingPc: -3);
  late final TextStyle quote2 =
      _createFont(quoteFont, sizePx: 21, heightPx: 32, weight: FontWeight.w400);
  late final TextStyle quote2Sub =
      _createFont(body, sizePx: 16, heightPx: 40, weight: FontWeight.w400);

  late final TextStyle caption = _createFont(contentFont,
          sizePx: 14, heightPx: 20, weight: FontWeight.w500)
      .copyWith(fontStyle: FontStyle.italic);

  late final TextStyle callout = _createFont(contentFont,
          sizePx: 16, heightPx: 26, weight: FontWeight.w600)
      .copyWith(fontStyle: FontStyle.italic);
  late final TextStyle btn = _createFont(contentFont,
      sizePx: 14, weight: FontWeight.w500, spacingPc: 2, heightPx: 14);

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
        fontWeight: weight);
  }
}

@immutable
class _Times {
  final Duration fast = const Duration(milliseconds: 400);
  final Duration med = const Duration(milliseconds: 600);
  final Duration slow = const Duration(milliseconds: 900);
  final Duration pageTransition = const Duration(milliseconds: 200);
}

class _Sizes {
  double get maxContentWidth1 => 800;
  double get maxContentWidth2 => 600;
  double get maxContentWidth3 => 500;
  final Size minAppSize = const Size(380, 650);
}

@immutable
class _Insets {
  _Insets(this._scale);
  final double _scale;

  late final double xxs = 4 * _scale;
  late final double xs = 8 * _scale;
  late final double sm = 16 * _scale;
  late final double md = 24 * _scale;
  late final double lg = 32 * _scale;
  late final double xl = 48 * _scale;
  late final double xxl = 56 * _scale;
  late final double offset = 80 * _scale;
}

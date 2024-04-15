import 'dart:async';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_gpt/core/di/injector.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/core/utils/platform_info.dart';

class AppSetap {
  Future<void> bootstrap(String environment) async {
    configureDependencies(environment);

    if (PlatformInfo.isDesktop) {
      await DesktopWindow.setMinWindowSize(const Size(380, 650));
    }

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: CupertinoColors.activeGreen,
      ),
    );
  }
}

import 'dart:async';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_gpt/shared/main/app_scaffold.dart';
import 'package:flutter_chat_gpt/shared/main/env_info.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/shared/utils/platform_info.dart';

class AppConfig {
  Future<void> bootstrap(AppEnvironment environment) async {
    if (PlatformInfo.isDesktop) {
      await DesktopWindow.setMinWindowSize(const Size(380, 650));
    }

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: CupertinoColors.activeGreen,
      ),
    );

    EnvInfo.initialize(environment);
  }
}

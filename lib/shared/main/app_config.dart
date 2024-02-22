import 'dart:async';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter_chat_gpt/shared/main/env_info.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/shared/utils/platform_info.dart';
import 'package:flutter_chat_gpt/core/domain/providers/localization_provider.dart';

class AppConfig {
  Future<void> bootstrap(AppEnvironment environment) async {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: CupertinoColors.activeGreen,
      ),
    );

    EnvInfo.initialize(environment);

    if (PlatformInfo.isDesktop) {
      await DesktopWindow.setMinWindowSize($styles.sizes.minAppSize);
    }

    final container = ProviderContainer();
    container.read(localizationProvider.notifier);
  }
}

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_gpt/shared/main/env_info.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';

class AppConfig {
  Future<void> bootstrap(AppEnvironment environment) async {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: CupertinoColors.activeGreen,
      ),
    );

    EnvInfo.initialize(environment);
  }
}

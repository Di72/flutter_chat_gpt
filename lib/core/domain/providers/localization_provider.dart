import 'package:flutter_chat_gpt/core/data/localization/localization_service.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';

final localizationProvider =
    AsyncNotifierProvider<LocalizationService, AppLocalizations>(
        LocalizationService.new);

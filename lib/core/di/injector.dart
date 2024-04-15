import 'package:flutter_chat_gpt/shared/commom_libs.dart';

import 'injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies(String env) => getIt.init(environment: env);

@module
abstract class RegisterModule {
  @Named("baseUrl")
  @dev
  String get baseUrlDev => 'https://api.openai.com/v1';

  @Named("baseUrl")
  @prod
  String get baseUrlProd => 'https://api.openai.com/v1';
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/chat/data/data_source/chat_api.dart' as _i5;
import '../../features/chat/data/repositories/chat_repository.dart' as _i6;
import '../data/network/dio_network_service.dart' as _i7;
import '../data/storage/isar_storage_service.dart' as _i4;
import 'injector.dart' as _i8;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioProvider = _$DioProvider();
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.Dio>(() => dioProvider.dio());
    gh.singleton<_i4.IsarStorageService>(() => _i4.IsarStorageService());
    gh.factory<String>(
      () => registerModule.baseUrlDev,
      instanceName: 'baseUrl',
      registerFor: {_dev},
    );
    gh.factory<String>(
      () => registerModule.baseUrlProd,
      instanceName: 'baseUrl',
      registerFor: {_prod},
    );
    gh.singleton<_i5.ChatApi>(() => _i5.ChatApi(
          gh<_i3.Dio>(),
          baseUrl: gh<String>(instanceName: 'baseUrl'),
        ));
    gh.factory<_i6.ChatRemoteRepository>(
        () => _i6.ChatRemoteRepository(chatApi: gh<_i5.ChatApi>()));
    return this;
  }
}

class _$DioProvider extends _i7.DioProvider {}

class _$RegisterModule extends _i8.RegisterModule {}

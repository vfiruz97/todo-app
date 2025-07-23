// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_dotenv/flutter_dotenv.dart' as _i170;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'application/services/todo_service.dart' as _i314;
import 'domain/repositories/i_todo_repository.dart' as _i1072;
import 'infrastructure/core/event_bus.dart' as _i363;
import 'infrastructure/network/http_service.dart' as _i527;
import 'infrastructure/network/network_info_service.dart' as _i212;
import 'infrastructure/network/network_module.dart' as _i343;
import 'infrastructure/repositories/todo_repository.dart' as _i655;
import 'injection.dart' as _i464;
import 'presentation/cubit/settings/settings_cubit.dart' as _i970;
import 'presentation/cubit/todo_form/todo_form_cubit.dart' as _i35;
import 'presentation/cubit/todo_list/todo_list_cubit.dart' as _i192;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    final connectivityModule = _$ConnectivityModule();
    final networkModule = _$NetworkModule();
    await gh.factoryAsync<_i170.DotEnv>(
      () => registerModule.dotEnv,
      preResolve: true,
    );
    gh.factory<_i895.Connectivity>(() => connectivityModule.connectivity());
    gh.lazySingleton<_i363.EventBus>(() => _i363.EventBus());
    gh.singleton<_i212.NetworkInfoService>(
      () => _i212.NetworkInfoService(gh<_i895.Connectivity>()),
    );
    gh.singleton<_i970.SettingsCubit>(
      () => _i970.SettingsCubit(gh<_i170.DotEnv>(), gh<_i363.EventBus>()),
    );
    gh.singleton<_i343.DioFactory>(
      () => networkModule.dioFactory(
        gh<_i170.DotEnv>(),
        gh<_i363.EventBus>(),
        gh<_i212.NetworkInfoService>(),
      ),
      dispose: (i) => i.close(),
    );
    gh.factory<_i527.HttpService>(
      () => _i527.HttpService(gh<_i343.DioFactory>()),
    );
    gh.factory<_i361.Dio>(() => networkModule.dio(gh<_i343.DioFactory>()));
    gh.factory<_i1072.ITodoRepository>(
      () => _i655.TodoRepository(
        gh<_i527.HttpService>(),
        gh<_i212.NetworkInfoService>(),
        gh<_i363.EventBus>(),
      ),
    );
    gh.factory<_i314.TodoService>(
      () => _i314.TodoService(
        gh<_i1072.ITodoRepository>(),
        gh<_i212.NetworkInfoService>(),
      ),
    );
    gh.singleton<_i192.TodoListCubit>(
      () => _i192.TodoListCubit(gh<_i314.TodoService>(), gh<_i363.EventBus>()),
    );
    gh.factory<_i35.TodoFormCubit>(
      () => _i35.TodoFormCubit(gh<_i314.TodoService>(), gh<_i363.EventBus>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i464.RegisterModule {}

class _$ConnectivityModule extends _i212.ConnectivityModule {}

class _$NetworkModule extends _i343.NetworkModule {}

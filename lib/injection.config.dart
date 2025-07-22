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

import 'domain/repositories/i_todo_repository.dart' as _i1072;
import 'domain/usecases/create_todo_usecase.dart' as _i1064;
import 'domain/usecases/delete_todo_usecase.dart' as _i796;
import 'domain/usecases/get_all_todos_usecase.dart' as _i604;
import 'domain/usecases/update_todo_usecase.dart' as _i550;
import 'infrastructure/network/http_service.dart' as _i527;
import 'infrastructure/network/network_info_service.dart' as _i212;
import 'infrastructure/network/network_module.dart' as _i343;
import 'infrastructure/repositories/todo_repository.dart' as _i655;
import 'injection.dart' as _i464;
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
    gh.factory<_i361.Dio>(() => networkModule.dio());
    gh.factory<_i527.HttpService>(() => _i527.HttpService(gh<_i361.Dio>()));
    gh.factory<_i1072.ITodoRepository>(
      () => _i655.TodoRepository(gh<_i527.HttpService>()),
    );
    gh.factory<_i212.NetworkInfoService>(
      () => _i212.NetworkInfoService(gh<_i895.Connectivity>()),
    );
    gh.factory<_i796.DeleteTodoUseCase>(
      () => _i796.DeleteTodoUseCase(gh<_i1072.ITodoRepository>()),
    );
    gh.factory<_i550.UpdateTodoUseCase>(
      () => _i550.UpdateTodoUseCase(gh<_i1072.ITodoRepository>()),
    );
    gh.factory<_i604.GetAllTodosUseCase>(
      () => _i604.GetAllTodosUseCase(gh<_i1072.ITodoRepository>()),
    );
    gh.factory<_i1064.CreateTodoUseCase>(
      () => _i1064.CreateTodoUseCase(gh<_i1072.ITodoRepository>()),
    );
    gh.factory<_i192.TodoListCubit>(
      () => _i192.TodoListCubit(
        gh<_i604.GetAllTodosUseCase>(),
        gh<_i796.DeleteTodoUseCase>(),
      ),
    );
    gh.factory<_i35.TodoFormCubit>(
      () => _i35.TodoFormCubit(
        gh<_i1064.CreateTodoUseCase>(),
        gh<_i550.UpdateTodoUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i464.RegisterModule {}

class _$ConnectivityModule extends _i212.ConnectivityModule {}

class _$NetworkModule extends _i343.NetworkModule {}

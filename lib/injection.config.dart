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
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:todo_app/domain/repositories/i_todo_repository.dart' as _i455;
import 'package:todo_app/domain/usecases/create_todo_usecase.dart' as _i26;
import 'package:todo_app/domain/usecases/delete_todo_usecase.dart' as _i932;
import 'package:todo_app/domain/usecases/get_all_todos_usecase.dart' as _i171;
import 'package:todo_app/domain/usecases/update_todo_usecase.dart' as _i950;
import 'package:todo_app/infrastructure/network/http_service.dart' as _i684;
import 'package:todo_app/infrastructure/network/network_info_service.dart'
    as _i619;
import 'package:todo_app/infrastructure/network/network_module.dart' as _i388;
import 'package:todo_app/infrastructure/repositories/todo_repository.dart'
    as _i653;
import 'package:todo_app/presentation/cubit/todo_form/todo_form_cubit.dart'
    as _i926;
import 'package:todo_app/presentation/cubit/todo_list/todo_list_cubit.dart'
    as _i137;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final connectivityModule = _$ConnectivityModule();
    final networkModule = _$NetworkModule();
    gh.factory<_i895.Connectivity>(() => connectivityModule.connectivity());
    gh.factory<_i361.Dio>(() => networkModule.dio());
    gh.factory<_i684.HttpService>(() => _i684.HttpService(gh<_i361.Dio>()));
    gh.factory<_i455.ITodoRepository>(
      () => _i653.TodoRepository(gh<_i684.HttpService>()),
    );
    gh.factory<_i619.NetworkInfoService>(
      () => _i619.NetworkInfoService(gh<_i895.Connectivity>()),
    );
    gh.factory<_i932.DeleteTodoUseCase>(
      () => _i932.DeleteTodoUseCase(gh<_i455.ITodoRepository>()),
    );
    gh.factory<_i950.UpdateTodoUseCase>(
      () => _i950.UpdateTodoUseCase(gh<_i455.ITodoRepository>()),
    );
    gh.factory<_i171.GetAllTodosUseCase>(
      () => _i171.GetAllTodosUseCase(gh<_i455.ITodoRepository>()),
    );
    gh.factory<_i26.CreateTodoUseCase>(
      () => _i26.CreateTodoUseCase(gh<_i455.ITodoRepository>()),
    );
    gh.factory<_i137.TodoListCubit>(
      () => _i137.TodoListCubit(
        gh<_i171.GetAllTodosUseCase>(),
        gh<_i932.DeleteTodoUseCase>(),
      ),
    );
    gh.factory<_i926.TodoFormCubit>(
      () => _i926.TodoFormCubit(
        gh<_i26.CreateTodoUseCase>(),
        gh<_i950.UpdateTodoUseCase>(),
      ),
    );
    return this;
  }
}

class _$ConnectivityModule extends _i619.ConnectivityModule {}

class _$NetworkModule extends _i388.NetworkModule {}

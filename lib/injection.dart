import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'infrastructure/config/config.dart';
import 'injection.config.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<Config> get config async {
    return await Config.loadFromDotEnv();
  }
}

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future configureDependencies() async => await getIt.init();

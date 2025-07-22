import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<DotEnv> get dotEnv async {
    final env = DotEnv();
    await env.load();
    return env;
  }
}

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future configureDependencies() async => await getIt.init();

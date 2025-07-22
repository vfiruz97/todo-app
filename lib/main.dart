import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'injection.dart';
import 'presentation/app/todo_app.dart';

void main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await dotenv.load(fileName: '.env');
      configureDependencies();

      runApp(const TodoApp());
    },
    (e, stack) {
      // Logging
    },
  );
}

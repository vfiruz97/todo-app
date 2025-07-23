import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'injection.dart';
import 'presentation/app/todo_app.dart';

void main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await configureDependencies();
      runApp(const TodoApp());
    },
    (error, stackTrace) {
      debugPrint('App error: $error');
      debugPrint('Stack trace: $stackTrace');

      if (kReleaseMode) {
        // TODO: Send to crash reporting service
      }
    },
  );
}

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'injection.dart';
import 'presentation/app/todo_app.dart';

void main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // Configure dependency injection
      await configureDependencies();

      runApp(const TodoApp());
    },
    (error, stackTrace) {
      // Log errors to console
      debugPrint('App error: $error');
      debugPrint('Stack trace: $stackTrace');

      if (kReleaseMode) {
        // In a production use Firebase Crashlytics, Sentry, etc.
      }
    },
  );
}

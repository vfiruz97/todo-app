import 'dart:async';

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
    (e, stack) => {
      // Handle errors
    },
  );
}

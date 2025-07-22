import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/todo_form/todo_form_page.dart';
import '../pages/todo_list/todo_list_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const TodoListPage()),
      GoRoute(path: '/todo/create', builder: (context, state) => const TodoFormPage()),
      GoRoute(
        path: '/todo/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return Scaffold(
            appBar: AppBar(title: Text('Todo Details: $id')),
            body: const Center(child: Text('Todo Details - Coming Soon')),
          );
        },
      ),
    ],
  );
}

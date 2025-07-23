import 'package:go_router/go_router.dart';

import '../pages/settings/settings_page.dart';
import '../pages/todo_detail/todo_detail_page.dart';
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
          final id = int.parse(state.pathParameters['id']!);
          return TodoDetailPage(todoId: id);
        },
      ),
      GoRoute(
        path: '/todo/edit/:id',
        builder: (context, state) {
          return const TodoFormPage();
        },
      ),
      GoRoute(path: '/settings', builder: (context, state) => const SettingsPage()),
    ],
  );
}

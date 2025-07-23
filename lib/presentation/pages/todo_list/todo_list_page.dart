import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/todo.dart';
import '../../../injection.dart';
import '../../cubit/todo_list/todo_list_cubit.dart';
import '../../cubit/todo_list/todo_list_state.dart';
import '../widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late TodoListCubit _todoListCubit;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
    _animationController.forward();
    _todoListCubit = getIt<TodoListCubit>()..loadTodos();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _todoListCubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => context.push('/settings'),
              tooltip: 'Settings',
            ),
          ],
        ),
        body: FadeTransition(
          opacity: _fadeAnimation,
          child: BlocBuilder<TodoListCubit, TodoListState>(
            builder: (context, state) {
              return state.when(
                initial: () => const Center(child: Text('Ready to load todos')),
                loading: () => const Center(child: CircularProgressIndicator()),
                loaded: (todos) => RefreshIndicator(
                  onRefresh: () async => context.read<TodoListCubit>().refresh(),
                  child: todos.isEmpty ? noTodosYet() : listViewBuilder(todos),
                ),
                error: (message) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error, size: 64, color: Colors.red),
                      const SizedBox(height: 16),
                      Text(
                        message,
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => context.read<TodoListCubit>().refresh(),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.push('/todo/create'),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget listViewBuilder(List<Todo> todos) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return TodoListItem(
          todo: todos[index],
          onTap: () => context.push('/todo/${todos[index].id}'),
          onDelete: () => context.read<TodoListCubit>().delete(todos[index].id!),
        );
      },
    );
  }

  Widget noTodosYet() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text('No todos yet', style: TextStyle(fontSize: 18, color: Colors.grey)),
        ],
      ),
    );
  }
}

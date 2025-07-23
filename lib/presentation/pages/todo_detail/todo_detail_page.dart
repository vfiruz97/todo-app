import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/todo.dart';
import '../../../injection.dart';
import '../../cubit/todo_form/todo_form_cubit.dart';
import '../../cubit/todo_form/todo_form_state.dart';

class TodoDetailPage extends StatelessWidget {
  const TodoDetailPage({super.key, required this.todoId});

  final int todoId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TodoFormCubit>()..loadTodo(todoId),
      child: BlocConsumer<TodoFormCubit, TodoFormState>(
        listener: (context, state) {
          if (state.status == FormzSubmissionStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'An error occurred'),
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
            );
          } else if (state.status == FormzSubmissionStatus.success && state.todo != null) {
            // Show success message after toggle completion
            if (state.todo!.isCompleted) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Todo marked as completed')));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Todo marked as pending')));
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Todo Details'),
              actions: [
                if (state.todo != null && state.status == FormzSubmissionStatus.success)
                  IconButton(icon: const Icon(Icons.edit), onPressed: () => context.push('/todo/edit/$todoId')),
              ],
            ),
            body: _buildBody(context, state),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, TodoFormState state) {
    if (state.status == FormzSubmissionStatus.inProgress) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status == FormzSubmissionStatus.failure) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Theme.of(context).colorScheme.error),
            const SizedBox(height: 16),
            Text('Error loading todo', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(
              state.errorMessage ?? 'Unknown error',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () => context.read<TodoFormCubit>().loadTodo(todoId), child: const Text('Retry')),
          ],
        ),
      );
    }

    if (state.todo != null) {
      return _buildTodoDetails(context, state.todo!);
    }

    return const Center(child: Text('Todo not found'));
  }

  Widget _buildTodoDetails(BuildContext context, Todo todo) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status Card
          _buildStatusCard(context, todo),
          const SizedBox(height: 16),
          // Title Card
          _buildContentCard(
            context,
            label: 'Title',
            content: todo.title,
            textStyle: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          // Description Card
          _buildContentCard(
            context,
            label: 'Description',
            content: todo.description.isNotEmpty ? todo.description : 'No description provided',
            textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: todo.description.isEmpty ? Theme.of(context).colorScheme.outline : null,
            ),
          ),
          const SizedBox(height: 16),
          // Metadata Card
          _buildMetadataCard(context, todo),
        ],
      ),
    );
  }

  Widget _buildStatusCard(BuildContext context, Todo todo) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              todo.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
              color: todo.isCompleted ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.outline,
              size: 28,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Status', style: Theme.of(context).textTheme.labelMedium),
                  Text(
                    todo.isCompleted ? 'Completed' : 'Pending',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () => context.read<TodoFormCubit>().toggleCompletion(),
              icon: Icon(todo.isCompleted ? Icons.undo : Icons.check),
              tooltip: todo.isCompleted ? 'Mark as pending' : 'Mark as completed',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentCard(
    BuildContext context, {
    required String label,
    required String content,
    TextStyle? textStyle,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: 8),
            Text(content, style: textStyle ?? Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }

  Widget _buildMetadataCard(BuildContext context, Todo todo) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Information', style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: 8),
            _buildInfoRow(context, 'Created', _formatDateTime(todo.createdAt)),
            const SizedBox(height: 4),
            _buildInfoRow(context, 'Last Updated', _formatDateTime(todo.updatedAt)),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.outline),
          ),
        ),
        Expanded(child: Text(value, style: Theme.of(context).textTheme.bodyMedium)),
      ],
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} at ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}

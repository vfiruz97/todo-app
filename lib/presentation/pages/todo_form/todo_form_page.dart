import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/todo.dart';
import '../../../injection.dart';
import '../../cubit/todo_form/todo_form_cubit.dart';
import '../../cubit/todo_form/todo_form_state.dart';
import '../../cubit/todo_list/todo_list_cubit.dart';

class TodoFormPage extends StatefulWidget {
  final Todo? todo;

  const TodoFormPage({super.key, this.todo});

  @override
  State<TodoFormPage> createState() => _TodoFormPageState();
}

class _TodoFormPageState extends State<TodoFormPage> with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<Offset> _slideAnimation;
  late final TodoFormCubit _todoFormCubit;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _animationController.forward();

    _todoFormCubit = getIt<TodoFormCubit>();

    if (widget.todo != null) {
      _titleController.text = widget.todo!.title;
      _descriptionController.text = widget.todo!.description;
      _todoFormCubit.initializeForm(widget.todo);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _todoFormCubit,
      child: Scaffold(
        appBar: AppBar(title: Text(widget.todo == null ? 'Create Todo' : 'Edit Todo')),
        body: SlideTransition(
          position: _slideAnimation,
          child: BlocListener<TodoFormCubit, TodoFormState>(
            listener: (context, state) {
              if (state.status.isSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(widget.todo == null ? 'Todo created successfully!' : 'Todo updated successfully!'),
                    backgroundColor: Colors.green,
                  ),
                );
                getIt<TodoListCubit>().loadTodos();
                context.pop();
              } else if (state.status.isFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage ?? 'An error occurred'), backgroundColor: Colors.red),
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BlocBuilder<TodoFormCubit, TodoFormState>(
                    buildWhen: (previous, current) => previous.title != current.title,
                    builder: (context, state) {
                      return TextFormField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          labelText: 'Title',
                          border: const OutlineInputBorder(),
                          errorText: state.title.displayError?.name,
                        ),
                        onChanged: (value) => context.read<TodoFormCubit>().titleChanged(value),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<TodoFormCubit, TodoFormState>(
                    buildWhen: (previous, current) => previous.description != current.description,
                    builder: (context, state) {
                      return TextFormField(
                        controller: _descriptionController,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          border: const OutlineInputBorder(),
                          errorText: state.description.displayError?.name,
                        ),
                        maxLines: 3,
                        onChanged: (value) => context.read<TodoFormCubit>().descriptionChanged(value),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  BlocBuilder<TodoFormCubit, TodoFormState>(
                    buildWhen: (previous, current) => previous.status != current.status,
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: state.status.isInProgress ? null : () => context.read<TodoFormCubit>().submitForm(),
                        child: state.status.isInProgress
                            ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2))
                            : Text(widget.todo == null ? 'Create' : 'Update'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

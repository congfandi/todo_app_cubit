import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit/data/model/todo.dart';
import 'package:todo_app_cubit/presentation/pages/todo_list/todo_list_cubit.dart';

import 'todo_add_state.dart';

class TodoAddCubit extends Cubit<TodoAddState> {
  TodoAddCubit() : super(TodoAddState().init());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  void actionSave({required BuildContext context}) {
    final cubit = context.read<TodoListCubit>();
    cubit.addTodo(Todo(
      title: titleController.text,
      description: descriptionController.text,
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
      isDone: false,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
    ));
    Navigator.pop(context);
  }
}

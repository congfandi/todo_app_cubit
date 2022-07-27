import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_cubit/data/model/todo.dart';
import 'package:todo_app_cubit/presentation/pages/todo_add/todo_add_view.dart';
import 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState(todos: []).init());

  void addTodo(Todo todo) {
    state.todos.add(todo);
    emit(state.clone());
  }

  void deleteTodo({required int index}) {
    state.todos.removeAt(index);
    emit(state.clone(

    ));
  }

  void goToAddTodo(BuildContext context) {
   Navigator.push(context, MaterialPageRoute(builder: (context) => TodoAddPage()));
  }
}

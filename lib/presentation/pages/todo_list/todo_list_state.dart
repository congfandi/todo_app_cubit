import 'package:equatable/equatable.dart';
import 'package:todo_app_cubit/data/model/todo.dart';

class TodoListState extends Equatable{
  List<Todo> todos = [];
  bool? isSelected = false;
  TodoListState({required this.todos,this.isSelected});

  TodoListState init() {
    return TodoListState(todos: []);
  }

  TodoListState clone() {
    return TodoListState(
      todos: List.from(todos),
      isSelected: isSelected,
    );
  }

  @override
  List<Object?> get props => [todos, isSelected];
}

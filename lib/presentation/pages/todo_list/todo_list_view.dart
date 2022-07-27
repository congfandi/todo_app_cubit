import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit/data/model/todo.dart';
import 'package:todo_app_cubit/presentation/pages/todo_list/todo_list_state.dart';

import 'todo_list_cubit.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build method");
    return BlocProvider(
      create: (BuildContext context){
        print("create method");
        return TodoListCubit();
      },
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    // final state = context.watch<TodoListState>();
    print("_buildPage method");
    final cubit = context.watch<TodoListCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
        // actions: [Switch(value: cubit2, onChanged: (newValue) {
        //   cubit2 = newValue;
        // })],
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => cubit.goToAddTodo(context),
        onPressed: () {
          cubit.addTodo(Todo(
            title: "titleController.text",
            description: "descriptionController.text",
            createdAt: DateTime.now().toIso8601String(),
            updatedAt: DateTime.now().toIso8601String(),
            isDone: false,
            id: DateTime.now().millisecondsSinceEpoch.toString(),
          ));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
          itemBuilder: (c, i) => ListTile(
                title: Text(
                  cubit.state.todos[i].title ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  cubit.state.todos[i].description ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => cubit.deleteTodo(index: i),
                ),
              ),
          separatorBuilder: (w, i) => const Divider(),
          itemCount: cubit.state.todos.length),
    );
  }
}

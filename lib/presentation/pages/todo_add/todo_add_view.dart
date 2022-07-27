import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit/presentation/pages/todo_list/todo_list_cubit.dart';
import 'package:todo_app_cubit/presentation/pages/todo_list/todo_list_view.dart';

import 'todo_add_cubit.dart';
import 'todo_add_state.dart';

class TodoAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TodoAddCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<TodoAddCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Todo'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: cubit.titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          TextFormField(
            controller: cubit.descriptionController,
            decoration: const InputDecoration(
              labelText: 'Description',
            ),
          ),
          ElevatedButton(
            onPressed: () => cubit.actionSave(context: context),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

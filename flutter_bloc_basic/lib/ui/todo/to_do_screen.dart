import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_basic/bloc/todo_bloc/to_do_bloc.dart';
import 'package:flutter_bloc_basic/bloc/todo_bloc/to_do_event.dart';
import 'package:flutter_bloc_basic/bloc/todo_bloc/to_do_state.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("To Do List"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<ToDoBloc, ToDoState>(builder: (context, state) {
            if (state.todos.isEmpty) {
              return const Center(
                child: Text("No Todo found"),
              );
            } else if (state.todos.isNotEmpty) {
              return ListView.builder(
                itemCount: state.todos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${state.todos[index]} $index + 1"),
                    trailing: IconButton(
                      onPressed: () {
                        context
                            .read<ToDoBloc>()
                            .add(RemoveToDoEvent(index: state.todos[index]));
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  );
                },
              );
            } else {
              return const SizedBox();
            }
          }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<ToDoBloc>().add(const AddToDoEvent(task: "Task"));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

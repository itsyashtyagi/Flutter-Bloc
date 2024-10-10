import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_basic/bloc/todo_bloc/to_do_event.dart';
import 'package:flutter_bloc_basic/bloc/todo_bloc/to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final List<String> todoList = [];
  ToDoBloc() : super(const ToDoState()) {
    on<AddToDoEvent>(_addToDoEvent);
    on<RemoveToDoEvent>(_removeToDoEvent);
  }

  void _addToDoEvent(AddToDoEvent event, Emitter<ToDoState> emit) {
    todoList.add(event.task);
    emit(state.copyWith(todos: List.from(todoList)));
  }

  void _removeToDoEvent(RemoveToDoEvent event, Emitter<ToDoState> emit) {
    todoList.remove(event.index);
    emit(state.copyWith(todos: List.from(todoList)));
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  List<String> todos = [];
  TodoBloc() : super(TodoInitial(todos: [])) {
    on<AddTodoEvent>((event, emit) {
      todos.add(event.todo);
      emit(TodoInitial(todos: todos));
    });
    on<RemoveTodoEvent>((event, emit) {
      if (event.index < todos.length) {
        todos.removeAt(event.index);
      }
      emit(TodoInitial(todos: todos));
    });
    on<UpdateTodoEvent>((event, emit) {
      if (event.index < todos.length) {
        todos[event.index] = event.newTodo;
        emit(TodoInitial(todos: todos));
      }
    });
  }
}

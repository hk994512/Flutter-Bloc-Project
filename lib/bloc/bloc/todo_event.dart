part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

final class AddTodoEvent extends TodoEvent {
  final String todo;
  AddTodoEvent({required this.todo});
}

final class RemoveTodoEvent extends TodoEvent {
  final int index;
  RemoveTodoEvent({required this.index});
}

class UpdateTodoEvent extends TodoEvent {
  final int index;
  final String newTodo;
  UpdateTodoEvent({required this.index, required this.newTodo});
}

part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {
  final List<String> todos;
  TodoInitial({required this.todos});
}

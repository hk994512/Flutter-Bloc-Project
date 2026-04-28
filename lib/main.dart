import 'package:bloc_project/bloc/bloc/todo_bloc.dart';
import 'package:bloc_project/bloc/theme_bloc.dart'
    show DarkEvent, DarkState, LightEvent, LightState, ThemeBloc, ThemeState;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeBloc()),
        BlocProvider(create: (_) => TodoBloc()),
      ],

      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state is DarkState ? ThemeData.dark() : ThemeData.light(),
            home: ThemeClass(),
          );
        },
      ),
    );
  }
}

class ThemeClass extends StatelessWidget {
  const ThemeClass({super.key});

  @override
  Widget build(BuildContext context) {
    final currentState = context.watch<ThemeBloc>().state;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final controller = TextEditingController();
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text('Add Todo'),
              content: TextField(
                controller: controller,
                decoration: InputDecoration(hintText: 'Enter todo...'),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      context.read<TodoBloc>().add(
                        AddTodoEvent(todo: controller.text),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (currentState is LightState) {
                context.read<ThemeBloc>().add(DarkEvent());
              }
              if (currentState is DarkState) {
                context.read<ThemeBloc>().add(LightEvent());
              }
            },
            icon: Icon(
              currentState is LightState ? Icons.dark_mode : Icons.light_mode,
            ),
          ),
        ],
        title: Text('Todo app'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoInitial) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                final todo = state.todos[index];
                return ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          final controller = TextEditingController(text: todo);
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text('Update Todo'),
                              content: TextField(
                                controller: controller,
                                decoration: InputDecoration(
                                  hintText: 'Update todo...',
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    if (controller.text.isNotEmpty) {
                                      context.read<TodoBloc>().add(
                                        UpdateTodoEvent(
                                          index: index,
                                          newTodo: controller.text,
                                        ),
                                      );
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: Text('Update'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      // Delete Button
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          context.read<TodoBloc>().add(
                            RemoveTodoEvent(index: index),
                          );
                        },
                      ),
                    ],
                  ),
                  leading: Text(todo),
                );
              },
            );
          }
          return Center(child: Text('No Todo here'));
        },
      ),
    );
  }
}

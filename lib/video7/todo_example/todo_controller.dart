import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t_flutter_riverpod_tutorial/video7/todo_example/todo_model.dart';

final todoProvider = StateNotifierProvider<TodoNotifier, List<TodoModel>>(
  (ref) {
    return TodoNotifier([]);
  },
);

class TodoNotifier extends StateNotifier<List<TodoModel>> {
  TodoNotifier(super._state);

  void add(String title) {
    final newTodo = TodoModel(
      id: state.isEmpty ? 0 : state.last.id + 1,
      title: title,
      completed: false,
    );
    state = [...state, newTodo];
  }

  void remove(int id) {
    state = state
        .where(
          (t) => t.id != id,
        )
        .toList();
  }

  void toggle(int id) {
    final todos = [...state];
    final index = todos.indexWhere((t) => t.id == id);
    if (index == -1) return;
    final todo = todos[index];
    todos[index] = todo.copyWith(completed: !todo.completed);

    state = todos;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t_flutter_riverpod_tutorial/video7/todo_example/todo_controller.dart';

class TodoScreen extends ConsumerStatefulWidget {
  const TodoScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoScreenState();
}

class _TodoScreenState extends ConsumerState<TodoScreen> {
  final controller = TextEditingController();

  addTodo(WidgetRef ref) {
    final notifier = ref.read(todoProvider.notifier);
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Enter your todo"),
            TextField(
              controller: controller,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                notifier.add(controller.text.trim());
                controller.clear();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Todo added sucessfully"),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.redAccent,
                    content: Text("Enter todo"),
                  ),
                );
              }
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todos = ref.watch(todoProvider);
    final notifier = ref.read(todoProvider.notifier);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTodo(ref);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Todo app"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return ListTile(
            title: Text(todo.title),
            subtitle: Text("completed: ${todo.completed}"),
            leading: IconButton(
              icon: Icon(
                todo.completed
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
              ),
              onPressed: () => notifier.toggle(todo.id),
            ),
            trailing: IconButton(
                onPressed: () => notifier.remove(todo.id),
                icon: Icon(Icons.delete)),
          );
        },
      ),
    );
  }
}

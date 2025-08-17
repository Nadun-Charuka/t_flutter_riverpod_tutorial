import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t_flutter_riverpod_tutorial/video7/counter_example/counter_controller.dart';

class Video7Counter extends ConsumerWidget {
  const Video7Counter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctrl = ref.read(counterProvider.notifier);

    return Scaffold(
      floatingActionButton: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: "inc",
            onPressed: () {
              ctrl.increment();
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: "dec",
            onPressed: () {
              ctrl.decrement();
            },
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            heroTag: "refresh",
            onPressed: () {
              ctrl.reset();
            },
            child: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final count = ref.watch(counterProvider);
            debugPrint("consumer method loaded");
            return Text(
              count.toString(),
              style: TextStyle(fontSize: 30),
            );
          },
        ),
      ),
    );
  }
}

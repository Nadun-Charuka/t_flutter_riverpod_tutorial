import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider(
  (ref) {
    return 0;
  },
);

class Video2 extends ConsumerWidget {
  const Video2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("builder method loaded");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final counter = ref.watch(counterProvider);
            debugPrint("consumer method loaded");
            return Text(counter.toString());
          },
        ),
      ),
    );
  }
}

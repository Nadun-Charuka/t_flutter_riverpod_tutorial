import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t_flutter_riverpod_tutorial/video8/async_notifier.dart';

class Video8 extends ConsumerWidget {
  const Video8({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greetingAsync = ref.watch(greetingAsyncProvider);
    final greetingAsyncNotifier = ref.read(greetingAsyncProvider.notifier);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          greetingAsyncNotifier.refreshGreeting();
        },
        child: Icon(Icons.refresh),
      ),
      appBar: AppBar(
        title: Text("Video8 AsyncNotifier"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            greetingAsync.when(
              skipLoadingOnRefresh: false,
              data: (data) => Text(data),
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}

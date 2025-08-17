import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t_flutter_riverpod_tutorial/services/all_services.dart';

final fakeApiProvider = Provider((ref) => FakeService());

final greetingFutureProvider = FutureProvider(
  (ref) async {
    final service = ref.read(fakeApiProvider);
    return await service.fetchGreeting();
  },
);

class Video5 extends ConsumerWidget {
  const Video5({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greetingAsync = ref.watch(greetingFutureProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Provider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            greetingAsync.when(
              skipLoadingOnRefresh: false,
              skipLoadingOnReload: false,
              data: (data) => Text(
                data,
                style: TextStyle(fontSize: 24),
              ),
              error: (error, stackTrace) => Column(
                spacing: 10,
                children: [
                  Text(
                    error.toString(),
                    style: TextStyle(color: Colors.red),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => ref.refresh(greetingFutureProvider),
                    label: Text("Retry"),
                    icon: Icon(Icons.refresh),
                  )
                ],
              ),
              loading: () => CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}

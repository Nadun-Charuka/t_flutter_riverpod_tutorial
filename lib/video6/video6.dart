import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t_flutter_riverpod_tutorial/services/all_services.dart';

final tickerServiceProvider = Provider((ref) => TickerService());

final tickerProvider = StreamProvider((ref) {
  final service = ref.read(tickerServiceProvider);
  return service.tickWithError();
});

class Video6 extends ConsumerWidget {
  const Video6({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickerAsync = ref.watch(tickerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Live Ticker"),
      ),
      body: Center(
        child: tickerAsync.when(
          skipLoadingOnRefresh: false,
          data: (count) => Text(
            "Timer :${count.toString()} ",
            style: TextStyle(fontSize: 30),
          ),
          error: (error, stackTrace) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Text(
                  error.toString(),
                  style: TextStyle(color: Colors.red),
                ),
                ElevatedButton.icon(
                  onPressed: () => ref.refresh(tickerProvider),
                  label: Text("Retry"),
                  icon: Icon(Icons.refresh),
                )
              ],
            );
          },
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}

import 'dart:math';

class FakeService {
  Future<String> fetchGreeting() async {
    await Future.delayed(Duration(seconds: 2));

    if (Random().nextDouble() < 0.2) {
      throw Exception('Failed to fetch greeting');
    }
    return 'Hello from Async!';
  }
}

class TickerService {
  Stream<int> tick() => Stream.periodic(
        Duration(seconds: 1),
        (count) => count,
      );

  Stream<int> tickWithError() async* {
    for (var i = 0; i < 5; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
    throw Exception("Timer stopped unexpectedly!");
  }
}

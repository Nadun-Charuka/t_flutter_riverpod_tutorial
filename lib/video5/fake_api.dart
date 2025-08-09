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

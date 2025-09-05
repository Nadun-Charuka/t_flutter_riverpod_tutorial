import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t_flutter_riverpod_tutorial/video5/video5.dart';

final greetingAsyncProvider =
    AsyncNotifierProvider<GreetingAsyncNotifier, String>(
  () => GreetingAsyncNotifier(),
);

class GreetingAsyncNotifier extends AsyncNotifier<String> {
  @override
  FutureOr<String> build() async {
    return await ref.read(fakeApiProvider).fetchGreeting();
  }

  Future<void> refreshGreeting() async {
    try {
      state = AsyncValue.loading();
      final value = await ref.read(fakeApiProvider).fetchGreeting();
      state = AsyncData(value);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}

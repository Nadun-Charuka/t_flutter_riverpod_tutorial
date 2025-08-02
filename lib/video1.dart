import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final staticStringProvider = Provider((Ref ref) {
  return 'Hello World!!';
});

final intProvider = Provider((Ref ref) {
  return 26;
});

final doubleProvider = Provider((Ref ref) {
  return 26.65;
});

class Video1 extends ConsumerWidget {
  const Video1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(staticStringProvider);
    final resultInt = ref.watch(intProvider);
    final resultDouble = ref.watch(doubleProvider);
    return Scaffold(
      body: Center(
        child: Text(result + resultInt.toString() + resultDouble.toString()),
      ),
    );
  }
}

/*every provider in a function,
Ref ref - refernece for the provider where this provider in providerscope
WidgetRef ref - for user interaction

*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textProvider = StateProvider(
  (ref) {
    return " ";
  },
);

class Video3 extends ConsumerStatefulWidget {
  const Video3({super.key});

  @override
  ConsumerState<Video3> createState() => _Video3State();
}

class _Video3State extends ConsumerState<Video3> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.addListener(
      () {
        ref.read(textProvider.notifier).state = _controller.text;
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = ref.watch(textProvider);
    debugPrint("build the app");
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              Text("You typed: $text"),
            ],
          ),
        ),
      ),
    );
  }
}

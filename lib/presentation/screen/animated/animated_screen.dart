import 'package:flutter/material.dart';

class AnimatedScreen extends StatelessWidget {
  static const String name = "Animated_Screen";

  const AnimatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool selected = true;

    return Scaffold(
      appBar: AppBar(title: const Text("Animated container")),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          width: selected ? 200.0 : 100.0,
          height: selected ? 100.0 : 200.0,
          decoration: BoxDecoration(
            color: selected ? Colors.red : Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          selected = !selected;
        },
        child: const Icon(Icons.play_arrow_outlined),
      ),
    );
  }
}

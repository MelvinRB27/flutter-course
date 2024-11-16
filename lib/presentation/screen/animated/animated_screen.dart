import 'dart:math' show Random;
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const String name = "Animated_Screen";

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 200.0;
  double height = 100.0;
  Color color = Colors.red;
  double borderRadius = 10.0;

  void onChangeShape() {
    final random = Random();
    width = random.nextInt(300) + 50;
    height = random.nextInt(300) + 50;
    // color = Colors.primaries[random.nextInt(Colors.primaries.length)];
    color = Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    borderRadius = random.nextInt(300) + 50;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated container")),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onChangeShape,
        child: const Icon(Icons.play_arrow_outlined),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = "Buttons_Screen";
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Botones'),
      ),
      body: const Placeholder(),
    );
  }
}

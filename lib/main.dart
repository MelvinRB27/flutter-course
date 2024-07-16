import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/screens/counter/counter_functions_screen.dart';
import 'package:flutter_application_1/presentation/screens/counter/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      // home: const CounterScreen(),
      home: const CounterFunctionsScreen(),
    );
  }
}

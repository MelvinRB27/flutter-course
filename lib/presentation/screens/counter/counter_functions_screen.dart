import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Functions"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _counter = 0;
                });
              },
              icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style:
                  const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            ),
            Text(
                _counter > 1
                    ? 'Clicks'
                    : _counter != 0
                        ? 'Click'
                        : '',
                style: const TextStyle(fontSize: 35)),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomActionButton(
            icon: Icons.refresh_outlined,
            onPressed: _counter != 0
                ? () {
                    _counter = 0;
                    setState(() {});
                  }
                : null,
          ),
          const SizedBox(height: 10),
          CustomActionButton(
            icon: Icons.plus_one,
            onPressed: () {
              _counter++;
              setState(() {});
            },
          ),
          const SizedBox(height: 10),
          CustomActionButton(
            icon: Icons.exposure_minus_1_outlined,
            bgColor: Colors.red,
            onPressed: _counter > 0
                ? () {
                    _counter--;
                    setState(() {});
                  }
                : null,
          )
        ],
      ),
    );
  }
}

class CustomActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? bgColor;

  const CustomActionButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: 'Increment',
      backgroundColor: bgColor,
      child: Icon(icon),
    );
  }
}

import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = "snackbar_Screen";

  const SnackbarScreen({super.key});

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    var snackBar = SnackBar(
      content: const Text("Esto es un snackbar"),
      action: SnackBarAction(
        label: "Aceptar",
        onPressed: () {},
      ),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbar y diálogos"),
      ),
      body: const Center(child: DialogExample()),
      floatingActionButton: FloatingActionButton.extended(
          label: const Text("Show Snackbar"),
          icon: const Icon(Icons.remove_red_eye_outlined),
          onPressed: () => showSnackBar(context)),
    );
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(
            onPressed: () => showAboutDialog(context: context, children: [
              const Text(
                  "Dolore laborum fugiat dolor laboris Lorem sint cupidatat aliqua eu eu. Labore laboris duis incididunt consequat ex. Est cillum ullamco pariatur anim tempor laborum pariatur labore adipisicing tempor. Officia fugiat ullamco et sit velit dolor ipsum sit adipisicing enim irure laborum in pariatur. Aliqua duis aute ut ad. Aute exercitation sit veniam enim pariatur. Duis tempor eiusmod fugiat exercitation."),
            ]),
            child: const Text('Lincecias usadas'),
          ),
          const SizedBox(height: 20),
          FilledButton.tonal(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('AlertDialog Title'),
                content: const Text('AlertDialog description'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            ),
            child: const Text('Show Dialog'),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  FullScreenLoader({super.key});
   
   
  final List<String> messages = [
    'Cargando...',
    'Espere un momento...',
    'Comprando palomitas...',
    'Buscando tus favoritos...',
  ];

  Stream<String> getLoadingMessages() {
    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return  Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(
          strokeWidth: 3,
        ),

        const SizedBox(height: 10),

        StreamBuilder(stream: getLoadingMessages(), builder: (context, snapshot) {
          if (!snapshot.hasData)  return const Text('Cargando...');

          return Text(snapshot.data!);
        }),
      ],
    ));
  }
}
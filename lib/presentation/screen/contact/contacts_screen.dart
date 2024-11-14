import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  static const String name = "Contacts_Screen";
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contactos'),
      ),
      body: const Placeholder(),
    );
  }
}

import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

var appMenuItems = <MenuItem>[
  const MenuItem(
    title: 'Botones',
    subTitle: 'Varios Botones',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  const MenuItem(
    title: 'Tarjetas',
    subTitle: 'Un contendor reutilizable',
    link: '/card',
    icon: Icons.credit_card,
  ),
  const MenuItem(
    title: 'Contact',
    subTitle: 'Contact',
    link: 'https://www.google.com',
    icon: Icons.contact_support,
  )
];

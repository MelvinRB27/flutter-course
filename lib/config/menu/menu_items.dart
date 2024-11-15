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
    link: '/cards',
    icon: Icons.credit_card,
  ),
  const MenuItem(
    title: 'Progress Indicators',
    subTitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_outlined,
  ),
  const MenuItem(
    title: 'Snackbar y diálogos',
    subTitle: 'Indicadores en pantalla',
    link: '/snackbar',
    icon: Icons.info,
  ),
  const MenuItem(
    title: 'Animated container',
    subTitle: 'Stateful widget animado',
    link: '/animated',
    icon: Icons.animation,
  ),
  const MenuItem(
    title: 'UI Controls + Tiles',
    subTitle: 'Una serie de controles de flutter',
    link: '/ui_controls',
    icon: Icons.videogame_asset,
  ),
  const MenuItem(
    title: 'Introducción a la aplicación',
    subTitle: 'pequeño tutorial introductorio',
    link: '/tutorial',
    icon: Icons.accessible,
  ),
  const MenuItem(
    title: 'Infinite Scroll y Pull',
    subTitle: 'Lista infinita y pull to refresh',
    link: '/tutorial',
    icon: Icons.settings_input_component_sharp,
  ),
];

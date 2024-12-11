import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (value) {
        setState(() {
          _selectedIndex = value;
        });

        context.push(appMenuItems[value].link);
        // widget.scaffoldKey.currentState?.openDrawer();
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16, 10),
          child: const Text(
            'Menu',
          ),
        ),
        ...appMenuItems.sublist(0, 3).map((e) => NavigationDrawerDestination(
              icon: Icon(e.icon),
              label: Text(e.title),
            )),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Divider(
            color: Colors.blue,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16, 10),
          child: const Text(
            'More options',
          ),
        ),
        ...appMenuItems.sublist(3).map((e) => NavigationDrawerDestination(
              icon: Icon(e.icon),
              label: Text(e.title),
            )),
      ],
    );
  }
}

// onPressed: () => context.push(e.link)
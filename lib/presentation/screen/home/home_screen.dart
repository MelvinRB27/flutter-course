import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  static const String name = "Home_Screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  final items = appMenuItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // padding: const EdgeInsets.all(8),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final MenuItem item = items[index];
          return SizedBox(
            height: 50,
            child: _CustomListTile(items: item),
          );
        });
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.items,
  });

  final MenuItem items;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(
        items.icon,
        color: colors.primary,
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(items.title),
      subtitle: Text(items.subTitle),
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const ButtonsScreen(),
        //   ),
        // );

        // Navigator.of(context).pushNamed(items.link);
        context.push(items.link);
      },
    );
  }
}

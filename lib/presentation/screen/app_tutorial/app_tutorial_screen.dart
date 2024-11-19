import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SliceInfo {
  final String title;
  final String description;
  final String image;

  SliceInfo(
      {required this.title, required this.description, required this.image});
}

final slices = <SliceInfo>[
  SliceInfo(
    title: 'Busca la comida',
    description:
        'Dolor consectetur quis minim laboris adipisicing id elit nisi esse. Fugiat nisi aute consequat minim aliqua excepteur veniam. Deserunt nulla culpa laboris ea cillum tempor pariatur consequat incididunt. Eu elit ad duis officia reprehenderit. Voluptate commodo fugiat fugiat duis. Id laboris magna adipisicing mollit cupidatat quis nulla enim amet ad nostrud do.',
    image: 'assets/images/1.png',
  ),
  SliceInfo(
    title: 'Entrega rápida',
    description:
        'Id magna consectetur consequat velit anim voluptate nostrud aute mollit cupidatat cupidatat aliqua. Laboris et irure esse exercitation et cupidatat. Ex laboris amet aliqua ad labore labore.',
    image: 'assets/images/2.png',
  ),
  SliceInfo(
    title: 'Disfruta de tu comida',
    description:
        'Commodo incididunt Lorem labore eiusmod et eiusmod ex aliqua aliqua quis eiusmod est. Do eu enim magna excepteur. Quis irure excepteur mollit sunt.',
    image: 'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = "tutorial_Screen";

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController controller = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      final page = controller.page ?? 0;
      if (!endReached && page >= (slices.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      } else {
        setState(() {
          endReached = false;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            physics: const BouncingScrollPhysics(),
            children: slices
                .map((data) => _Slice(
                    title: data.title,
                    description: data.description,
                    image: data.image))
                .toList(),
          ),
          Positioned(
              top: 30,
              right: 10,
              child: TextButton(
                  child: const Text('Salir'), onPressed: () => context.pop())),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 10,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(milliseconds: 200),
                    child: FilledButton(
                        child: const Text('Comenzar'),
                        onPressed: () => context.pop()),
                  ))
              : const SizedBox()
        ],
      ),
    );
  }
}

class _Slice extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const _Slice(
      {required this.title, required this.description, required this.image});

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image),
          const SizedBox(height: 20),
          Text(title),
          const SizedBox(height: 10),
          Text(description),
        ],
      ),
    );
  }
}

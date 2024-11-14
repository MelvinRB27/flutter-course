import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screen/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      builder: (context, state) => ButtonsScreen(),
    ),
    GoRoute(
      path: '/cards',
      builder: (context, state) => CardsScreen(),
    ),
    GoRoute(
      path: '/contacts',
      builder: (context, state) => ContactsScreen(),
    ),
  ],
);

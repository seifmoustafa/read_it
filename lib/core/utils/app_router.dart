import 'package:go_router/go_router.dart';
import 'package:knowledge_world/main.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    )
  ]);
}

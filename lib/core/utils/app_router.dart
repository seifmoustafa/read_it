import 'package:go_router/go_router.dart';
import 'package:knowledge_world/features/auth/login/login_view.dart';
import 'package:knowledge_world/features/splash/splash_view.dart';

abstract class AppRouter {
  static const kLoginView = '/loginView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kLoginView,
      builder: (context, state) => const LoginView(),
    ),
  ]);
}

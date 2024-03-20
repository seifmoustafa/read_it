import 'package:go_router/go_router.dart';
import 'package:read_it/features/auth/login/login_view.dart';
import 'package:read_it/features/auth/register/register_view.dart';
import 'package:read_it/features/splash/splash_view.dart';

abstract class AppRouter {
  static const kLoginView = '/loginView';
  static const kRegisterView = '/registerView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kLoginView,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: kRegisterView,
      builder: (context, state) => const RegisterView(),
    ),
  ]);
}

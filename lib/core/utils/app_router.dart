import 'package:go_router/go_router.dart';
import 'package:knowledge_world/features/splash/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    //  GoRoute(
    //   path: kHomeView,
    //   builder: (context, state) => const HomeView(),
    // ),
  ]);
}

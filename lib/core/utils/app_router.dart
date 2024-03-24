import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:read_it/features/auth/presentation/manage/login_cubit/login_cubit.dart';
import 'package:read_it/features/auth/presentation/manage/register_cubit/register_cubit.dart';
import 'package:read_it/features/auth/presentation/manage/reset_password_cubit/reset_password_cubit.dart';
import 'package:read_it/features/auth/presentation/views/login/login_view.dart';
import 'package:read_it/features/auth/presentation/views/register/register_view.dart';
import 'package:read_it/features/auth/presentation/views/reset_password/reset_password_view.dart';
import 'package:read_it/features/home/presentation/views/home_view.dart';
import 'package:read_it/features/search/presentation/views/search_view.dart';
import 'package:read_it/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kLoginView = '/loginView';
  static const kRegisterView = '/registerView';
  static const kHomeView = '/homeView';
  static const kResetPasswordView = '/resetPasswordView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kLoginView,
      builder: (context, state) => BlocProvider(
        create: (context) => LoginCubit(),
        child: const LoginView(),
      ),
    ),
    GoRoute(
      path: kRegisterView,
      builder: (context, state) => BlocProvider(
        create: (context) => RegisterCubit(),
        child: const RegisterView(),
      ),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: kResetPasswordView,
      builder: (context, state) => BlocProvider(
        create: (context) => ResetPasswordCubit(),
        child: const ResetPasswordView(),
      ),
    ),
    GoRoute(
      path: kSearchView,
      builder: (context, state) => const SearchView(),
    ),
  ]);
}

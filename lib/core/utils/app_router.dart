import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/core/book_model/book_model.dart';
import 'package:read_it/core/utils/service_locator.dart';
import 'package:read_it/core/widgets/custom_web_view.dart';
import 'package:read_it/features/home/presentation/views/home_view.dart';
import 'package:read_it/features/search/presentation/views/search_view.dart';
import 'package:read_it/features/splash/presentation/views/splash_view.dart';
import 'package:read_it/features/auth/presentation/views/login/login_view.dart';
import 'package:read_it/features/home/data/repos/home_repo_implementation.dart';
import 'package:read_it/features/home/presentation/views/book_details_view.dart';
import 'package:read_it/features/search/data/repos/search_repos_implementation.dart';
import 'package:read_it/features/auth/presentation/views/register/register_view.dart';
import 'package:read_it/features/auth/presentation/manage/login_cubit/login_cubit.dart';
import 'package:read_it/features/profile/presentation/views/profile_view/profile_view.dart';
import 'package:read_it/features/auth/presentation/manage/register_cubit/register_cubit.dart';
import 'package:read_it/features/profile/presentation/manage/profile_cubit/profile_cubit.dart';
import 'package:read_it/features/auth/presentation/views/reset_password/reset_password_view.dart';
import 'package:read_it/features/search/presentation/manage/search_cubit/searched_book_cubit.dart';
import 'package:read_it/features/home/presentation/manage/newest_books_cubit/newest_books_cubit.dart';
import 'package:read_it/features/home/presentation/manage/popular_books_cubit/popular_books_cubit.dart';
import 'package:read_it/features/auth/presentation/manage/reset_password_cubit/reset_password_cubit.dart';

abstract class AppRouter {
  static const kLoginView = '/loginView';
  static const kRegisterView = '/registerView';
  static const kHomeView = '/homeView';
  static const kResetPasswordView = '/resetPasswordView';
  static const kSearchView = '/searchView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kProfileView = '/profileView';
  static const kWebView = '/customWebView';
  static const kFavoriteView = '/favoriteView';
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
      builder: (context, state) => MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => PopularBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchPopularBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchNewestBooks(),
        )
      ], child: const HomeView()),
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
      builder: (context, state) => BlocProvider(
        create: (context) => SearchedBookCubit(getIt.get<SearchReposImpl>())
          ..fetchSearchedBooks(),
        child: const SearchView(),
      ),
    ),
    GoRoute(
      path: kBookDetailsView,
      builder: (context, state) => BlocProvider(
        create: (context) => ProfileCubit(),
        child: BookDetailsView(
          bookModel: state.extra as BookModel,
        ),
      ),
    ),
    GoRoute(
      path: kWebView,
      builder: (context, state) => CustomWebView(
        url: state.extra as String,
      ),
    ),
    GoRoute(
      path: kProfileView,
      builder: (context, state) => const ProfileView(),
    ),
    GoRoute(
      path: kFavoriteView,
      builder: (context, state) => const ProfileView(),
    )
  ]);
}

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:read_it/core/utils/api_service.dart';
import 'package:read_it/features/home/data/repos/home_repo_implementation.dart';
import 'package:read_it/features/search/data/repos/search_repos_implementation.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(getIt.get<ApiService>()),
  );
  getIt.registerSingleton<SearchReposImpl>(
      SearchReposImpl(getIt.get<ApiService>()));
}

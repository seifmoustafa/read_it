import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:read_it/core/errors/failure.dart';
import 'package:read_it/core/utils/api_service.dart';
import 'package:read_it/core/book_model/book_model.dart';
import 'package:read_it/features/profile/data/profile_repos.dart';

class ProfilReposImpl implements ProfileRepos {
  final ApiService apiService;

  ProfilReposImpl(this.apiService);

  @override
  Future<Either<Failure, BookModel>> fetchFavoritebooks(
      {required String bookId}) async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=$bookId');
      BookModel? books;
      for (var item in data['items']) {
        books = BookModel.fromJson(item);
      }
      return right(books!);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      } else {
        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }
  }
}

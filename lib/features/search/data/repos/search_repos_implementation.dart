import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:read_it/core/errors/failure.dart';
import 'package:read_it/core/utils/api_service.dart';
import 'package:read_it/core/book_model/book_model.dart';
import 'package:read_it/features/search/data/repos/search_repos.dart';

class SearchReposImpl implements SearchRepos {
  final ApiService apiService;

  SearchReposImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=$category');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
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

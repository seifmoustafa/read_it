import 'package:dartz/dartz.dart';
import 'package:read_it/core/errors/failure.dart';
import 'package:read_it/core/book_model/book_model.dart';

abstract class SearchRepos {
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(
      {required String category});
}

import 'package:dartz/dartz.dart';
import 'package:read_it/core/errors/failure.dart';
import 'package:read_it/core/book_model/book_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks(
      {int pageNumber = 0});
  Future<Either<Failure, List<BookModel>>> fetchPopularBooks(
      {int pageNumber = 0});
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category, int pageNumber = 0});
}

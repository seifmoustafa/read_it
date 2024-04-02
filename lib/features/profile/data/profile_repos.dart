import 'package:dartz/dartz.dart';
import 'package:read_it/core/errors/failure.dart';
import 'package:read_it/core/book_model/book_model.dart';

abstract class ProfileRepos {
  Future<Either<Failure, BookModel>> fetchFavoritebooks(
      {required String bookId});
}

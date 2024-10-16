part of 'newest_books_cubit.dart';

abstract class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {}

class NewestBooksPaginationLoading extends NewestBooksState {}

class NewestBooksPaginationFaliure extends NewestBooksState {
  final String errMessage;

  NewestBooksPaginationFaliure({required this.errMessage});
}

class NewestBooksSuccess extends NewestBooksState {
  final List<BookModel> books;

  const NewestBooksSuccess(this.books);
}

class NewestBooksFailure extends NewestBooksState {
  final String errorMessage;

  const NewestBooksFailure(this.errorMessage);
}

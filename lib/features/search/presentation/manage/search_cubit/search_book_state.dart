part of 'searched_book_cubit.dart';

abstract class SearchedBookState extends Equatable {
  const SearchedBookState();

  @override
  List<Object> get props => [];
}

class SearchedBookInitial extends SearchedBookState {}

class SearchedBookLoading extends SearchedBookState {}

class SearchedBookSuccess extends SearchedBookState {
  final List<BookModel> bookModel;

  const SearchedBookSuccess(this.bookModel);
}

class SearchedBookFailure extends SearchedBookState {
  final String errMessage;

  const SearchedBookFailure(this.errMessage);
}

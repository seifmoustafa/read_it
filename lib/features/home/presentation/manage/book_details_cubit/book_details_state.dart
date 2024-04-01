part of 'book_details_cubit.dart';

abstract class BookdetailsState extends Equatable {
  const BookdetailsState();

  @override
  List<Object> get props => [];
}

class BookdetailsInitial extends BookdetailsState {}

class FavouriteItem extends BookdetailsState {
  final String bookId;

  const FavouriteItem(this.bookId);
}

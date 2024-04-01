part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class RetriveItemsSuccess extends FavoriteState {
  final List<BookModel> books;

  const RetriveItemsSuccess(this.books);
}

class FavoriteItemsLoading extends FavoriteState {}

class FavoriteItemsError extends FavoriteState {
  final String errorMessage;

  const FavoriteItemsError(this.errorMessage);
}

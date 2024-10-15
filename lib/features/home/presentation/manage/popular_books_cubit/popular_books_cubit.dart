import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/core/book_model/book_model.dart';
import 'package:read_it/features/home/data/repos/home_repos.dart';

part 'popular_books_state.dart';

class PopularBooksCubit extends Cubit<PopularBooksState> {
  PopularBooksCubit(this.homeRepo) : super(PopularBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchPopularBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(PopularBooksLoading());
    } else {
      emit(PopularBooksPaginationLoading());
    }
    var result = await homeRepo.fetchPopularBooks(pageNumber: pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(PopularBooksFailure(errMessage: failure.errMessage));
      } else {
        emit(PopularBooksPaginationFaliure(errMessage: failure.errMessage));
      }
    }, (books) {
      emit(PopularBooksSuccess(books: books));
    });
  }
}

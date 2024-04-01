import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/core/book_model/book_model.dart';
import 'package:read_it/features/search/data/repos/search_repos.dart';

part 'search_book_state.dart';

class SearchedBookCubit extends Cubit<SearchedBookState> {
  SearchedBookCubit(this.searchRepos) : super(SearchedBookInitial());

  final SearchRepos searchRepos;

  Future<void> fetchSearchedBooks({String categoryName = 'mix'}) async {
    emit(SearchedBookLoading());
    var result = await searchRepos.fetchSearchedBooks(category: categoryName);
    result.fold((failure) {
      emit(SearchedBookFailure(failure.errMessage));
    }, (books) {
      emit(SearchedBookSuccess(books));
    });
  }
}

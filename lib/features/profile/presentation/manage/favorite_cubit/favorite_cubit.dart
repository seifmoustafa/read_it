import 'package:read_it/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:read_it/core/book_model/book_model.dart';
import 'package:read_it/features/profile/data/profile_repos.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.profileRepos) : super(FavoriteInitial());
  final ProfileRepos profileRepos;
  final _firestore = FirebaseFirestore.instance;
  final _user = FirebaseAuth.instance;
  Future<void> fetchFavoriteItems() async {
    try {
      emit(FavoriteItemsLoading());

      final snapshot = await _firestore
          .collection(kUserCollection)
          .doc(FirebaseAuth.instance.currentUser!.email)
          .get();

      final data = snapshot.data();
      List<String> favoriteBookIds = List<String>.from(data?[kFavorites] ?? []);

      List<BookModel> favoriteBooks = await _retrieveBooks(favoriteBookIds);

      emit(FavoriteItemsSuccess(favoriteBooks)); // Emit success state
    } catch (error) {
      emit(FavoriteItemsError(
          'Failed to retrieve favorite items: $error')); // Emit failure state
    }
  }

  Future<List<BookModel>> _retrieveBooks(List<String> bookIds) async {
    List<BookModel> books = [];

    for (String bookId in bookIds) {
      var response = await profileRepos.fetchFavoritebooks(bookId: bookId);
      response.fold(
          (failure) => emit(
              const FavoriteItemsError('Failed to retrieve favorite items')),
          (book) => books.add(book));
    }

    return books;
  }
}

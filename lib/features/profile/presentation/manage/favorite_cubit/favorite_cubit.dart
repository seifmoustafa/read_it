import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:read_it/core/book_model/book_model.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial()) {
    fetchFavoriteItems();
  }
  final _firestore = FirebaseFirestore.instance;

  Future<void> fetchFavoriteItems() async {
    try {
      emit(FavoriteItemsLoading());

      final snapshot = await _firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .get();

      final data = snapshot.data();
      List<String> favoriteBookIds =
          List<String>.from(data?['favorites'] ?? []);

      List<BookModel> favoriteBooks = await _retrieveBooks(favoriteBookIds);

      emit(RetriveItemsSuccess(favoriteBooks)); // Emit success state
    } catch (error) {
      emit(FavoriteItemsError(
          'Failed to retrieve favorite items: $error')); // Emit failure state
    }
  }

  Future<List<BookModel>> _retrieveBooks(List<String> bookIds) async {
    List<BookModel> books = [];

    for (String bookId in bookIds) {
      try {
        // Retrieve BookModel from Firestore using book ID
        final snapshot = await _firestore.collection('books').doc(bookId).get();
        final bookData = snapshot.data();

        if (bookData != null) {
          books.add(BookModel.fromJson(bookData));
        }
      } catch (error) {
        print('Failed to retrieve book with ID $bookId: $error');
      }
    }

    return books;
  }
}
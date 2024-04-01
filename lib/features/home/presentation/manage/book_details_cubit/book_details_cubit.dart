import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:read_it/core/book_model/book_model.dart';

part 'book_details_state.dart';



class BookdetailsCubit extends Cubit<BookdetailsState> {
  BookdetailsCubit() : super(BookdetailsInitial());


 final _firebaseStorage = FirebaseStorage.instance;
  final _firestore = FirebaseFirestore.instance;
  Future<void> checkFavoriteStatus(String bookId) async {
    try {
      // Fetch user's favorites list from the database
      final snapshot = await _firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .get();

      final data = snapshot.data();
      List<String> favorites = List<String>.from(data?['favorites'] ?? []);

      // Check if the book is in favorites
      if (favorites.contains(bookId)) {
        emit(FavouriteItem(bookId)); // Emit FavouriteItem state
      }
    } catch (error) {
      throw ('Failed to check favorite status: $error');
    }
  }

  Future<void> addToFavorites(BookModel book) async {
    try {
      // Fetch user's favorites list from the database
      final snapshot = await _firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .get();

      final data = snapshot.data();
      List<String> favorites = List<String>.from(data?['favorites'] ?? []);

      // Check if the book is already in favorites
      if (!favorites.contains(book.id)) {
        favorites.add(book.id.toString()); // Add book to favorites list
        await _updateFavorites(
            favorites); // Update favorites list in the database
        emit(FavouriteItem(book.id!)); // Emit FavouriteItem state
      }
    } catch (error) {}
  }

  Future<void> _updateFavorites(List<String> favorites) async {
    try {
      await _firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .set({'favorites': favorites}, SetOptions(merge: true));
    } catch (error) {
      throw ('Failed to update favorites: $error');
    }
  }
}

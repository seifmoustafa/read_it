import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:read_it/core/book_model/book_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final ImagePicker _picker = ImagePicker();
  final _firebaseStorage = FirebaseStorage.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<void> fetchProfileImageUrl() async {
    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .get();

      final data = snapshot.data();
      final imageUrl = data?['profileImageUrl'] as String?;

      if (imageUrl != null) {
        emit(ProfileImagePicked(File(imageUrl))); // Convert URL to File
      }
    } catch (error) {
      emit(const ProfileImageFailure('Failed to fetch profile image'));
    }
  }

  Future<void> pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        emit(ProfileImageLoading()); // Emit loading state while uploading
        final imageUrl = await _uploadImage(pickedFile.path);
        await _saveImageUrl(imageUrl);
        emit(ProfileImageUploaded(
            imageUrl)); // Emit uploaded state with new image URL
      }
    } catch (error) {
      emit(ProfileImageFailure('Failed to pick image: $error'));
    }
  }

  Future<String> _uploadImage(String filePath) async {
    try {
      final ref = _firebaseStorage
          .ref()
          .child('user_images')
          .child(FirebaseAuth.instance.currentUser!.email!)
          .child('profile_image.jpg');

      final uploadTask = await ref.putFile(File(filePath));
      return await uploadTask.ref.getDownloadURL();
    } catch (error) {
      throw ('Failed to upload image: $error');
    }
  }

  Future<void> _saveImageUrl(String imageUrl) async {
    try {
      await _firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .set({'profileImageUrl': imageUrl}, SetOptions(merge: true));
    } catch (error) {
      throw ('Failed to save image URL: $error');
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
        emit(FavouriteItem( book.id!)); // Emit FavouriteItem state
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
        emit(FavouriteItem( bookId)); // Emit FavouriteItem state
      }
    } catch (error) {
      throw ('Failed to check favorite status: $error');
    }
  }

  void reset() {
    emit(ProfileInitial());
  }

  Future<String> fetchUserName() async {
    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .get();

      final data = snapshot.data();
      final userName = data?['userName'] as String?;

      if (userName != null) {
        return userName;
      } else {
        throw ('User name not found');
      }
    } catch (error) {
      throw ('Failed to fetch user name: $error');
    }
  }

  Future<void> signOut() async {
    emit(SignOutLoading());
    try {
      await FirebaseAuth.instance.signOut();
      await _saveLoginState(false);
      emit(SignOutSuccess());
    } catch (error) {
      emit(SignOutFailure('Something wrong'));
    }
  }

  Future<void> _saveLoginState(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', isLoggedIn);
  }
}

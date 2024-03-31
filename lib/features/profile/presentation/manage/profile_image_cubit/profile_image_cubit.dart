import 'dart:io';
import 'package:flutter/material.dart';
import 'package:read_it/constants.dart';
import 'package:go_router/go_router.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
// profile_image_cubit.dart

part 'profile_image_state.dart';

class ProfileImageCubit extends Cubit<ProfileImageState> {
  ProfileImageCubit() : super(ProfileImageInitial()) {
    fetchProfileImageUrl();
  }

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

  void reset() {
    emit(ProfileImageInitial());
  }

  Future<String> fetchUserName() async {
    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .get();

      final data = snapshot.data();
      final userName = data?[kUserName] as String?;

      if (userName != null) {
        return userName;
      } else {
        throw ('User name not found');
      }
    } catch (error) {
      throw ('Failed to fetch user name: $error');
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      await _saveLoginState(false);
      GoRouter.of(context).go(AppRouter.kLoginView);
    } catch (error) {
      throw ('Failed to sign out: $error');
    }
  }

  Future<void> _saveLoginState(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', isLoggedIn);
  }
}

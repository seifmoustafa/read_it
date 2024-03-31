import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_image_state.dart';

class ProfileImageCubit extends Cubit<ProfileImageState> {
  ProfileImageCubit() : super(ProfileImageInitial()) {
    _fetchProfileImageUrl();
  }

  final ImagePicker _picker = ImagePicker();
  final _firebaseStorage = FirebaseStorage.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<void> _fetchProfileImageUrl() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? imageUrl = prefs.getString('profileImageUrl');
      print('Fetched profile image URL: $imageUrl');

      if (imageUrl != null) {
        emit(ProfileImagePicked(File(''))); // Placeholder for picked image
        emit(ProfileImageUploaded(imageUrl));
      }
    } catch (error) {
      print('Error fetching profile image URL: $error');
      emit(ProfileImageFailure('Failed to fetch profile image'));
    }
  }

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      emit(ProfileImagePicked(File(pickedFile.path)));
      try {
        final imageFile = File(pickedFile.path);
        final imageUrl = await _uploadImage(imageFile);
        await _saveImageUrl(imageUrl);
      } catch (error) {
        emit(ProfileImageFailure('Failed to upload image'));
      }
    }
  }

  Future<String> _uploadImage(File imageFile) async {
    final ref = _firebaseStorage
        .ref()
        .child('user_images')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child('profile_image.jpg');

    await ref.putFile(imageFile);
    return ref.getDownloadURL();
  }

  Future<void> _saveImageUrl(String imageUrl) async {
    await _firestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .set({'profileImageUrl': imageUrl}, SetOptions(merge: true));
  }

  void reset() {
    emit(ProfileImageInitial());
  }
}

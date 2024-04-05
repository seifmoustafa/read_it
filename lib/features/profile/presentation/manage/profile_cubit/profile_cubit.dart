import 'dart:io';
import 'package:read_it/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial()) {
    fetchProfileImageUrl();
  }

  final ImagePicker _picker = ImagePicker();
  final _firebaseStorage = FirebaseStorage.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<void> fetchProfileImageUrl() async {
    try {
      emit(ProfileImageLoading());
      final snapshot = await _firestore
          .collection(kUserCollection)
          .doc(FirebaseAuth.instance.currentUser!.email)
          .get();

      final data = snapshot.data();
      final imageUrl = data?[kProfileImage] as String?;

      if (imageUrl != null) {
        emit(ProfileImagePicked(File(imageUrl))); // Convert URL to File
      } else {
        emit(ProfileImageNotPicked());
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
          .collection(kUserCollection)
          .doc(FirebaseAuth.instance.currentUser!.email)
          .set({kProfileImage: imageUrl}, SetOptions(merge: true));
    } catch (error) {
      throw ('Failed to save image URL: $error');
    }
  }

  void reset() {
    emit(ProfileInitial());
  }

  Future<void> signOut() async {
    emit(SignOutLoading());
    try {
      await FirebaseAuth.instance.signOut();
      await _saveLoginState(false);
      emit(SignOutSuccess());
    } catch (error) {
      emit(const SignOutFailure('Something wrong'));
    }
  }

  Future<void> _saveLoginState(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', isLoggedIn);
  }

  Future<String> fetchUserName() async {
    try {
      final snapshot = await _firestore
          .collection(kUserCollection)
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
}

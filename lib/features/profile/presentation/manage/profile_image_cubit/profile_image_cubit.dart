import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

part 'profile_image_state.dart';

class ProfileimageCubit extends Cubit<ProfileimageState> {
  ProfileimageCubit() : super(ProfileimageInitial());

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      emit(ProfileimagePicked(File(pickedFile.path)));
    } else {
      emit(const ProfileimageFailure('Something wrong'));
    }
  }

  Future<void> uploadImage(File imageFile) async {
    final Reference storageRef = FirebaseStorage.instance
        .ref()
        .child('user_images')
        .child(FirebaseAuth.instance.currentUser!
            .uid) // Replace 'user_id' with the actual user ID
        .child('image.jpg'); // You can use user-specific filenames if needed

    await storageRef.putFile(imageFile);
    final String downloadUrl = await storageRef.getDownloadURL();

    // Save the download URL to the user's profile in Firestore or Firebase Authentication
    emit(ProfileimageUploaded(downloadUrl));
  }

  void reset() {
    emit(ProfileimageInitial());
  }
}

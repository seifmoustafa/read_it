import 'package:read_it/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'profile_edit_state.dart';

class ProfileEditCubit extends Cubit<ProfileEditState> {
  ProfileEditCubit() : super(ProfileEditInitial());

  final _firestore = FirebaseFirestore.instance;

  Future<void> editUserName(String userName) async {
    try {
      emit(ProfileEditLoading());
      await _firestore
          .collection(kUserCollection)
          .doc(FirebaseAuth.instance.currentUser!.email)
          .set(
        {kUserName: userName},
        SetOptions(merge: true),
      );
      emit(ProfileEditSuccess());
    } catch (e) {
      emit(const ProfileEditFailure('Failed to edit user name'));
    }
  }

  Future<void> editPhoneNumber(String phoneNumber) async {
    try {
      emit(ProfileEditLoading());
      await _firestore
          .collection(kUserCollection)
          .doc(FirebaseAuth.instance.currentUser!.email)
          .set(
        {kPhoneNumber: phoneNumber},
        SetOptions(merge: true),
      );
      emit(ProfileEditSuccess());
    } catch (e) {
      emit(const ProfileEditFailure('Failed to edit phone number'));
    }
  }

  Future<void> changePassword(String oldPassword, String newPassword) async {
    try {
      emit(ProfileEditLoading());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: FirebaseAuth.instance.currentUser!.email!,
        password: oldPassword,
      );
      await FirebaseAuth.instance.currentUser!.updatePassword(newPassword);
      emit(ProfileEditSuccess());
    } catch (e) {
      emit(const ProfileEditFailure('Failed to change passowrd'));
    }
  }
}

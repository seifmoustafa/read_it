import 'dart:math';
import 'package:read_it/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

part 'profile_details_state.dart';

class ProfileDetailsCubit extends Cubit<ProfileDetailsState> {
  ProfileDetailsCubit() : super(ProfileDetailsInitial());

  final _firebaseStorage = FirebaseStorage.instance;
  final _firestore = FirebaseFirestore.instance;
  // Future<void> fetchUserFirstName() async {
  //   try {
  //     emit(ProfiledetailsLoading());
  //     final snapshot = await _firestore
  //         .collection(kUserCollection)
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .get();
  //     final data = snapshot.data();
  //     final userName = data?[kUserName] as String?;
  //     final firstName = userName?.split(' ')[0];
  //     if (firstName != null) {
  //       emit(ProfileDetailsSuccess(firstName));
  //     } else {
  //       emit(ProfileDetailsFaliure('Faild to get first name'));
  //     }
  //   } catch (e) {
  //     emit(ProfileDetailsFaliure('Faild to get first name'));
  //   }
  // }

  // Future<void> fetchUserLastName() async {
  //   try {
  //     emit(ProfiledetailsLoading());

  //     final snapshot = await _firestore
  //         .collection(kUserCollection)
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .get();
  //     final data = snapshot.data();
  //     final userName = data?[kUserName] as String?;
  //     final lastName = userName?.split(' ')[1];
  //     if (lastName != null) {
  //       emit(ProfiledetailSuccess(lastName));
  //     } else {
  //       emit(ProfileDetailsFaliure('Faild to get last name'));
  //     }
  //   } catch (e) {
  //     emit(ProfileDetailsFaliure('Faild to get last name'));
  //   }
  // }

  // Future<void> fetchUserPhoneNumber() async {
  //   try {
  //     emit(ProfiledetailsLoading());

  //     final snapshot = await _firestore
  //         .collection(kUserCollection)
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .get();
  //     final data = snapshot.data();
  //     final phoneNumber = data?[kPhoneNumber] as String?;
  //     if (phoneNumber != null) {
  //       emit(ProfiledetailSuccess(phoneNumber));
  //     } else {
  //       emit(ProfileDetailsFaliure('Faild to get phone number'));
  //     }
  //   } catch (e) {
  //     emit(ProfileDetailsFaliure('Faild to get phone number'));
  //   }
  // }

  Future<void> fetchProfileDetails() async {
    try {
      emit(ProfiledetailsLoading());

      final snapshot = await _firestore
          .collection(kUserCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      final data = snapshot.data();
      final userName = data?[kUserName] as String?;
      final phoneNumber = data?[kPhoneNumber] as String?;
      final email = data?[kEmail] as String?;

      if (userName != null && phoneNumber != null && email != null) {
        emit(ProfileDetailSuccess(
          userName: userName,
          phoneNumber: phoneNumber,
          email: email,
        ));
      } else {
        emit(const ProfileDetailsFailure('Profile details not found'));
      }
    } catch (error) {
      emit(ProfileDetailsFailure('Failed to fetch profile details: $error'));
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/constants.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  Future<void> resetPassword(String email) async {
    emit(ResetPasswordLoading());
    try {
      // Send password reset email

      CollectionReference userData =
          FirebaseFirestore.instance.collection(kUserCollection);
      QuerySnapshot querySnapshot =
          await userData.where('email', isEqualTo: email).get();

      if (querySnapshot.docs.isNotEmpty) {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        emit(ResetPasswordSuccess());
      } else {
        emit(ResetPasswordFailure(errMessage: 'Email not found'));
      }
    } catch (e) {
      emit(ResetPasswordFailure(errMessage: 'Failed to reset password'));
    }
  }
}

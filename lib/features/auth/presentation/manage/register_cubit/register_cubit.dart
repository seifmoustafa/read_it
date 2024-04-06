import 'dart:async';
import 'package:flutter/material.dart';
import 'package:read_it/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  // Register user with email and password
  Future<void> registerUserWithEmail({
    required String userName,
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await _saveLoginState(true);

      await saveUser(
          email: email, userName: userName, phoneNumber: phoneNumber);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errMessage: 'Email already in use'));
      } else if (e.code == 'weak-password') {
        emit(RegisterFailure(errMessage: 'Weak password'));
      } else if (e.code == 'invalid-email') {
        emit(RegisterFailure(errMessage: 'Invalid Email'));
      } else {
        emit(RegisterFailure(errMessage: 'Something went wrong'));
      }
    } catch (ex) {
      emit(RegisterFailure(errMessage: 'Something went wrong'));
    }
  }

  // Register user with Google
  Future<void> registerUserWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user != null) {
        final user = userCredential.user!;
        await saveUser(
            email: user.email!,
            userName: user.displayName!,
            phoneNumber:
                ''); // You may not have phone number for Google sign-up
        await _saveLoginState(true);
        emit(RegisterSuccess());
      } else {
        emit(RegisterFailure(errMessage: 'User not found'));
      }
    } catch (e) {
      emit(RegisterFailure(errMessage: 'Something went wrong'));
    }
  }

  Future<void> saveUser({
    required String email,
    required String userName,
    required String phoneNumber,
  }) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(
      kUserCollection,
    );
    await collectionReference.doc(FirebaseAuth.instance.currentUser!.uid).set({
      kUserName: userName,
      kEmail: email,
      kPhoneNumber: phoneNumber,
    });
  }

  Future<void> _saveLoginState(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', isLoggedIn);
  }
}

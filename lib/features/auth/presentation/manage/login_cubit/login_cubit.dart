import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:read_it/constants.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        bool isFirstTimeGoogleSignIn =
            await _checkFirstTimeGoogleSignIn(userCredential.user!);

        if (isFirstTimeGoogleSignIn) {
          await saveUser(
            email: userCredential.user!.email!,
            firstName: '', // Add first name if available
            lastName: '', // Add last name if available
            phoneNumber: '', // Add phone number if available
          );
        }

        await _saveLoginState(true);
        emit(LoginSuccess());
      } else {
        emit(LoginFailure(errMessage: 'Google sign-in failed'));
      }
    } catch (e) {
      log(e.toString());
      emit(LoginFailure(errMessage: 'Something went wrong'));
    }
  }

  // Method for signing in with email and password
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      await _saveLoginState(true);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        emit(LoginFailure(errMessage: 'Invalid Email or Password'));
      } else {
        emit(LoginFailure(errMessage: 'Something wrong'));
      }
    } catch (e) {
      emit(LoginFailure(errMessage: 'Something wrong'));
    }
  }

  Future<bool> _checkFirstTimeGoogleSignIn(User user) async {
    bool isFirstTimeGoogleSignIn = false;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('googleSignIn')) {
      isFirstTimeGoogleSignIn = true;
      prefs.setBool('googleSignIn', true);
    }
    return isFirstTimeGoogleSignIn;
  }

  Future<void> _saveLoginState(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', isLoggedIn);
  }

  Future<void> saveUser({
    required String email,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(
      kUserCollection,
    );
    await collectionReference.doc(email).set({
      kUserName: '$firstName $lastName',
      kEmail: email,
      kPhoneNumber: phoneNumber,
    });
  }

  Future<void> signInWithFacebook() async {
    emit(LoginLoading());
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        final UserCredential userCredential = await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);

        bool isFirstTimeFacebookSignIn =
            await _checkFirstTimeFacebookSignIn(userCredential.user!);

        if (isFirstTimeFacebookSignIn) {
          await saveUser(
            email: userCredential.user!.email!,
            firstName: '', // Add first name if available
            lastName: '', // Add last name if available
            phoneNumber: '', // Add phone number if available
          );
        }

        await _saveLoginState(true);
        emit(LoginSuccess());
      } else {
        emit(LoginFailure(errMessage: 'Facebook sign-in failed'));
      }
    } catch (e) {
      log(e.toString());
      emit(LoginFailure(errMessage: 'Something went wrong'));
    }
  }

  Future<bool> _checkFirstTimeFacebookSignIn(User user) async {
    bool isFirstTimeFacebookSignIn = false;
    try {
      // Check if the user's data exists in Firestore
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      isFirstTimeFacebookSignIn = !userSnapshot.exists;
    } catch (e) {
      print('Error checking first time Facebook sign-in: $e');
    }
    return isFirstTimeFacebookSignIn;
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../routes/routes.dart';

class AuthController extends GetxController {
  bool isVisible = false;
  bool checkBox = false;
  var username = '';
  var userPhoto = '';
  var userEmail = '';
  final auth = FirebaseAuth.instance;
  //----------------------------------google
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  void visibility() {
    isVisible = !isVisible;
    update();
  }

  void checkBoxMode() {
    checkBox = !checkBox;
  }

  void showmysnackbar({required String text}) {
    Get.showSnackbar(GetSnackBar(
      message: text,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 5),
      borderRadius: 15,
    ));
  }

  //---------------------------------------------------------------------signup
  Future<void> signupToFirebase({
    required String nameController,
    required String emailController,
    required String passwordController,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: emailController, password: passwordController)
          .then((value) {
        username = nameController;
        auth.currentUser!.updateDisplayName(nameController);
      });
      showmysnackbar(text: 'Done..Please Sign in ) ');
      Get.toNamed(Names.loginScreen);
    } on FirebaseAuthException catch (e) {
      e.code == 'email-already-in-use'
          ? showmysnackbar(
              text: 'The email address is already in use by another account')
          : showmysnackbar(text: e.message ?? '');
    }
  }

  //---------------------------------------------------------------------signin
  Future<void> loginToFirebase({
    required String emailController,
    required String passwordController,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(
              email: emailController, password: passwordController)
          .then((value) {
        return username = auth.currentUser!.displayName ?? '';
      });
      Get.offNamed(Names.homeScreen);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showmysnackbar(
            text:
                'there is no user corresponding to the given email SignUp please ');
      } else if (e.code == 'wrong-password') {
        showmysnackbar(text: 'password is invalid for the given email');
      } else {
        showmysnackbar(text: e.message ?? '');
      }
    }
  }

  signupWithGoogle() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

//    signupWithFacebook() {}
  //---------------------------------------------------------------------restPassword
  Future<void> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      Get.back();
      showmysnackbar(
          text:
              'Done !!.Check Your Email to Reset Password.if you don\'t found,chech your Spam.');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showmysnackbar(
            text: 'There is no user registered with this email address ');
      } else {
        showmysnackbar(text: e.message ?? 'Error');
      }
    }
  }
}

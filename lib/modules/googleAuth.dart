//import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    try {
      // Trigger the Google Sign-In process
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return null; // The user canceled the sign-in

      // Obtain authentication details from Google
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential using Google tokens
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      UserCredential userCredential = await _auth.signInWithCredential(credential);

      return userCredential.user; // Firebase automatically registers the user if needed
    } catch (error) {
      print("Google Sign-In error: $error");
      return null;
    }
  }

  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();
    await _auth.signOut();
  }
}

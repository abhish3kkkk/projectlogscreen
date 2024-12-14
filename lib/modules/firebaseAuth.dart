import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication {

  final FirebaseAuth _auth = FirebaseAuth.instance; //This to initialize Firebase Auth to use Authentication methods of firebase

  Future<User?> signUp(String _mail , String _pass) async{
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: _mail,
      password: _pass,
    );
    return userCredential.user;
  }

  Future<User?> logIn(String _mail , String _pass) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: _mail,
      password: _pass,
    );
    return userCredential.user;
  }
}
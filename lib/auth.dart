import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<String> currentUser();
  Future<void> signOut();
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    FirebaseUser user = (await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    return user.uid;
  }

  Future<String> createUserWithEmailAndPassword(
      String email, String password) async {
    FirebaseUser user = (await _firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    return user.uid;
  }

  Future<String> currentUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user.uid;
  }

  Future<void> signOut() async {
    return FirebaseAuth.instance.signOut();
  }

  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser();
    return user != null;
  }

  Future<String> getUserId() async {
    return (await _firebaseAuth.currentUser()).uid;
  }
}

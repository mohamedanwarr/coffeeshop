// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Models/UserModel.dart';

class LoginandSignup extends ChangeNotifier {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool islogin = false;
  bool _isloading = false;
  String title = "Enjoy the\ndrink coffee";

  void isLoginSelected(bool showtextfiled) {
    islogin = false;
    title = "Welcome\nBack";

    notifyListeners();
  }

  void issignupSelected(bool showtextfiled) {
    islogin = true;
    title = "Sign up to get \nthe best coffee";

    notifyListeners();
  }

  User? _userfromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    } else {
      return User(
        uid: user.uid,
        email: user.email,
      );
    }
  }
  bool get isloading => _isloading;

  void loading() {
    _isloading = true;
    notifyListeners();
  }

  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map(_userfromFirebase);
  }

  //Login
  Future<User?> loginWithEmailAndPassword(String email, String password,) async {
    final auth.UserCredential credential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);

    return _userfromFirebase(credential.user);
  }

  Future<User?> createsignupWithEmailAndPassword(String email, String password,) async {
    final auth.UserCredential credential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

    final auth.User? user = credential.user;
    if (user != null) {
      User newUser = User(
        uid: user.uid,
        email: user.email,
      );
      await _firestore.collection("users").doc(user.uid).set(newUser.toMap()!);
      return newUser;
    }
    return null;
  }

  Future<User?> forgetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(
      email: email,
    );
    return null;
  }
  Future<void> signOut() async {
    return _firebaseAuth.signOut().then((value) => null);

}
}

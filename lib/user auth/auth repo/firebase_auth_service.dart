import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todojango/Utils/utils.dart';
// import 'package:todojango/services/todo_services.dart';

class FirebaseAuthViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User?> signInwithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // TodoFireBaseServices services =
      //     TodoFireBaseServices(userId: credential.user!.uid);
      // services.addUserData("Add Your Todo");
      return credential.user;
    } catch (e) {
      // ignore: use_build_context_synchronously
      Utils.flushbarErrorMessage("User Not Found", context);
      return null;
    }
  }

  Future<User?> signUpwithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      // ignore: use_build_context_synchronously
      Utils.flushbarErrorMessage(e.toString(), context);
      return null;
    }
  }

  Future<User?> signUpwithGoogle(BuildContext context) async {
    try {
      GoogleAuthProvider google = GoogleAuthProvider();
      UserCredential credential = await _auth.signInWithProvider(google);
      return credential.user;
    } catch (e) {
      // ignore: use_build_context_synchronously
      Utils.flushbarErrorMessage(e.toString(), context);
      return null;
    }
  }

  Future<void> signout(BuildContext context) async {
    try {
      _auth.signOut();
    } catch (e) {
      Utils.flushbarErrorMessage(e.toString(), context);
    }
  }
}

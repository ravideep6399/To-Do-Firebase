import 'package:flutter/material.dart';
import 'package:todojango/Utils/utils.dart';
import 'package:todojango/user%20auth/auth%20repo/firebase_auth_service.dart';

class UserViewModel with ChangeNotifier {
  final repo = FirebaseAuthViewModel();
  // ignore: non_constant_identifier_names
  bool Loading = false;
  bool get _Loading => Loading;
  setLoading(value) {
    Loading = value;
    notifyListeners();
  }

  Future<void> signIn(
      String email, String password, BuildContext context) async {
    setLoading(true);
    repo.signInwithEmailAndPassword(email, password, context).then((value) {
      setLoading(false);
      if (value == null) {
        Utils.flushbarErrorMessage("Some Error Ocurred", context);
        throw ();
      }
      Navigator.pushNamedAndRemoveUntil(context, 'Home', (route) => false);
    }).onError((error, stackTrace) {
      Utils.flushbarErrorMessage(error.toString(), context);
    });
  }

  Future<void> signUp(
      String email, String password, BuildContext context) async {
    setLoading(true);
    repo.signUpwithEmailAndPassword(email, password, context).then((value) {
      setLoading(false);
      if (value == null) {
        Utils.flushbarErrorMessage("Some Error Ocurred", context);
        throw ();
      }
      Navigator.pushNamedAndRemoveUntil(context, 'Home', (route) => false);
    }).onError((error, stackTrace) {
      Utils.flushbarErrorMessage(error.toString(), context);
    });
  }

  Future<void> googleSignIn(BuildContext context) async {
    setLoading(true);
    repo.signUpwithGoogle(context).then((value) {
      setLoading(false);
      if (value == null) {
        Utils.flushbarErrorMessage("Some Error Ocurred", context);
        throw ();
      }
      Navigator.pushNamedAndRemoveUntil(context, 'Home', (route) => false);
    }).onError((error, stackTrace) {
      Utils.flushbarErrorMessage(error.toString(), context);
    });
  }

  Future<void> signOut(BuildContext context) async {

      repo.signout(context);
      Navigator.pushNamedAndRemoveUntil(context, 'Login', (route) => false);
      Utils.flushbarErrorMessage("You have been Logged Out", context);
  }
}

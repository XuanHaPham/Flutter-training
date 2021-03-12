import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stockwise_mobile/core/app_models/result_app_model.dart';

abstract class IAuthViewmodel implements ChangeNotifier {
  User get currentUser;

  void initUser();
  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<void> signInWithGoogle();
  Future<void> signInWithFacebook();
  Future<void> signUp(
    String email,
    String password,
  );
  Future<void> signOut();
  Future<ResultAppModel> resetPassword(String email);
}

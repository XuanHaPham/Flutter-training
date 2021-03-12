import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:stockwise_mobile/core/app_models/result_app_model.dart';
import 'package:stockwise_mobile/core/services/interfaces/iauth_service.dart';
import 'package:stockwise_mobile/utils/function_utils.dart';

class AuthService implements IAuthService {
  Future<DataResultAppModel<User>> _executeAuthFunction(
    Future<UserCredential> Function() authFunction,
  ) async {
    UserCredential userCredential;
    ResultAppModel result = await FunctionUtils.execFirebaseAuthFunction(
      () async {
        userCredential = await authFunction();
      },
    );

    return DataResultAppModel<User>(
      isSuccess: result.isSuccess,
      errorMessage: result.errorMessage,
      data: result.isSuccess == true ? userCredential.user : null,
    );
  }

  /// Sign in failed => `result.data == null`
  @override
  Future<DataResultAppModel<User>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return await _executeAuthFunction(
      () async {
        return await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      },
    );
  }

  /// Sign in failed => `result.data == null`
  ///
  /// Process aborted => `result.errorMessage == [null | ''] && result.data == null`
  @override
  Future<DataResultAppModel<User>> signInWithGoogle() async {
    GoogleSignInAccount googleUser;

    try {
      googleUser = await GoogleSignIn().signIn();
    } catch (e) {
      Logger().e(e.message);
      return DataResultAppModel<User>(
        isSuccess: false,
        errorMessage: e.message,
        data: null,
      );
    }

    if (googleUser == null) {
      // Process aborted
      return DataResultAppModel<User>(
        isSuccess: false,
        errorMessage: null,
        data: null,
      );
    }

    final googleAuth = await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await _executeAuthFunction(
      () async {
        return await FirebaseAuth.instance.signInWithCredential(credential);
      },
    );
  }

  /// Sign in failed => `result.data == null`
  ///
  /// Process aborted => `result.errorMessage == [null | ''] && result.data == null`
  @override
  Future<DataResultAppModel<User>> signInWithFacebook() async {
    AccessToken accessToken;
    try {
      accessToken = await FacebookAuth.instance.login(
        loginBehavior: LoginBehavior.DIALOG_ONLY,
      );
    } catch (e) {
      // Process aborted
      Logger().e(e.message);
      return DataResultAppModel<User>(
        isSuccess: false,
        errorMessage: null,
        data: null,
      );
    }

    // Create a new credential
    final FacebookAuthCredential credential =
        FacebookAuthProvider.credential(accessToken?.token);

    DataResultAppModel<User> finalResult = await _executeAuthFunction(
      () async {
        return await FirebaseAuth.instance.signInWithCredential(credential);
      },
    );

    return finalResult;
  }

  /// Sign in failed => `result.data == null`
  @override
  Future<DataResultAppModel<User>> signUp(
    String email,
    String password,
  ) async {
    return await _executeAuthFunction(
      () async {
        return await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      },
    );
  }

  @override
  Future<ResultAppModel> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();

      await Future.wait([
        _signOutGoogleSession(),
        _signOutFacebookSession(),
      ]);

      return ResultAppModel(
        isSuccess: true,
      );
    } catch (e) {
      Logger().e(e.message);
      return ResultAppModel(
        isSuccess: false,
        errorMessage: 'Something went wrong',
      );
    }
  }

  Future<void> _signOutGoogleSession() async {
    final isSignedIn = await GoogleSignIn().isSignedIn();
    if (isSignedIn) {
      await GoogleSignIn().signOut();
    }
  }

  Future<void> _signOutFacebookSession() async {
    final facebookAccessToken = await FacebookAuth.instance.isLogged;
    if (facebookAccessToken != null) {
      await FacebookAuth.instance.logOut();
    }
  }

  @override
  Future<ResultAppModel> resetPassword(String email) async {
    return FunctionUtils.execFirebaseAuthFunction(() async {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    });
  }
}

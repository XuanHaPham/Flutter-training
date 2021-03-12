import 'package:firebase_auth/firebase_auth.dart';
import 'package:stockwise_mobile/core/app_models/result_app_model.dart';

abstract class IAuthService {
  /// Sign in failed => `result.data == null`
  Future<DataResultAppModel<User>> signInWithEmailAndPassword(
    String email,
    String password,
  );

  /// Sign in failed => `result.data == null`
  ///
  /// Process aborted => `result.errorMessage == [null | ''] && result.data == null`
  Future<DataResultAppModel<User>> signInWithGoogle();

  /// Sign in failed => `result.data == null`
  ///
  /// Process aborted => `result.errorMessage == [null | ''] && result.data == null`
  Future<DataResultAppModel<User>> signInWithFacebook();

  Future<DataResultAppModel<User>> signUp(
    String email,
    String password,
  );

  Future<ResultAppModel> signOut();

  Future<ResultAppModel> resetPassword(String email);
}

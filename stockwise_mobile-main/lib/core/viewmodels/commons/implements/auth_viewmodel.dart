import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stockwise_mobile/core/app_models/result_app_model.dart';
import 'package:stockwise_mobile/core/services/interfaces/iauth_service.dart';
import 'package:stockwise_mobile/core/viewmodels/commons/interfaces/iauth_viewmodel.dart';
import 'package:stockwise_mobile/global/global_data.dart';
import 'package:stockwise_mobile/global/locator/locator.dart';
import 'package:stockwise_mobile/global/app_router.dart';
import 'package:stockwise_mobile/ui/commons/app_message_dialog.dart';
import 'package:stockwise_mobile/utils/dialog_utils.dart';
import 'package:stockwise_mobile/utils/loading_dialog_utils.dart';
import 'package:stockwise_mobile/utils/navigation_utils.dart';
import 'package:stockwise_mobile/utils/string_utils.dart';

class AuthViewmodel extends ChangeNotifier implements IAuthViewmodel {
  final _globalData = locator<GlobalData>();
  final _authService = locator<IAuthService>();

  User _currentUser;
  @override
  User get currentUser => _currentUser;

  void _setCurrentUser(User user) {
    _globalData.currentUser = FirebaseAuth.instance.currentUser;
    _currentUser = FirebaseAuth.instance.currentUser;
  }

  @override
  void initUser() {
    _setCurrentUser(FirebaseAuth.instance.currentUser);
    notifyListeners();
  }

  @override
  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    await LoadingDialogUtils.showLoading();
    DataResultAppModel<User> result =
        await _authService.signInWithEmailAndPassword(email, password);
    await LoadingDialogUtils.hideLoading();

    _setCurrentUser(result.data);
    notifyListeners();

    _proceedLoginSignupResult(result);
  }

  @override
  Future<void> signInWithGoogle() async {
    await LoadingDialogUtils.showLoading();
    DataResultAppModel<User> result = await _authService.signInWithGoogle();
    await LoadingDialogUtils.hideLoading();

    _setCurrentUser(result.data);
    notifyListeners();

    _proceedLoginSignupResult(result);
  }

  @override
  Future<void> signInWithFacebook() async {
    await LoadingDialogUtils.showLoading();
    DataResultAppModel<User> result = await _authService.signInWithFacebook();
    await LoadingDialogUtils.hideLoading();

    _setCurrentUser(result.data);
    notifyListeners();

    _proceedLoginSignupResult(result);
  }

  @override
  Future<void> signUp(
    String email,
    String password,
  ) async {
    await LoadingDialogUtils.showLoading();
    DataResultAppModel<User> result =
        await _authService.signUp(email, password);
    await LoadingDialogUtils.hideLoading();

    _setCurrentUser(result.data);
    notifyListeners();

    _proceedLoginSignupResult(result);
  }

  void _proceedLoginSignupResult(ResultAppModel result) async {
    // Succeeded
    if (result.isSuccess) {
      NavigationUtils.navigateOff(AppRouter.home);
    } else {
      // Failed with error
      if (!StringUtils.isNullOrEmpty(result.errorMessage)) {
        DialogUtils.showMessageDialog(
          type: AppMessageDialogType.error,
          messageText: result.errorMessage,
        );
      }
      // Process aborted
      else {}
    }
  }

  @override
  Future<void> signOut() async {
    await LoadingDialogUtils.showLoading();
    await _authService.signOut();
    await LoadingDialogUtils.hideLoading();

    _setCurrentUser(null);
    notifyListeners();

    NavigationUtils.navigateOffAll(AppRouter.login);
  }

  @override
  Future<ResultAppModel> resetPassword(String email) async {
    return await _authService.resetPassword(email);
  }
}

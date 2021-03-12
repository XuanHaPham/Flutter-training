import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:stockwise_mobile/core/app_models/result_app_model.dart';
import 'package:stockwise_mobile/core/viewmodels/commons/interfaces/iauth_viewmodel.dart';
import 'package:stockwise_mobile/ui/commons/app_dialog.dart';
import 'package:stockwise_mobile/ui/commons/app_message_dialog.dart';
import 'package:stockwise_mobile/ui/commons/keyboard_unfocus_wrapper.dart';
import 'package:stockwise_mobile/utils/dialog_utils.dart';
import 'package:stockwise_mobile/utils/loading_dialog_utils.dart';
import 'package:stockwise_mobile/utils/regex_utils.dart';

class DialogForgotPassword extends StatefulWidget {
  DialogForgotPassword({Key key}) : super(key: key);

  @override
  _DialogForgotPasswordState createState() => _DialogForgotPasswordState();
}

class _DialogForgotPasswordState extends State<DialogForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final _textEmailController = TextEditingController();

  IAuthViewmodel _authViewmodel;

  @override
  void initState() {
    super.initState();

    _authViewmodel = context.read<IAuthViewmodel>();
  }

  @override
  void dispose() {
    _textEmailController.dispose();

    super.dispose();
  }

  void _closeDialog() {
    Get.back();
  }

  String _validatorEmail(String value) {
    if (!RegexUtils.emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  Future<void> _submitResetPassword() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    await LoadingDialogUtils.showLoading();
    ResultAppModel result =
        await _authViewmodel.resetPassword(_textEmailController.text);
    await LoadingDialogUtils.hideLoading();

    if (!result.isSuccess) {
      print(result.errorMessage);
      DialogUtils.showMessageDialog(
        type: AppMessageDialogType.error,
        messageText: result.errorMessage,
      );
    } else {
      _closeDialog();
      DialogUtils.showMessageDialog(
        type: AppMessageDialogType.success,
        messageText: 'An email has been sent to your address.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardUnfocusWrapper(
      child: AppDialog(
        titleText: 'Reset Password',
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'Worry not! We will email the instructions to reset your password.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _textEmailController,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    prefixIcon: Icon(Ionicons.md_mail),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: _validatorEmail,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) async {
                    await _submitResetPassword();
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          AppDialogAction(
            onPressed: () {
              _closeDialog();
            },
            text: 'Cancel',
            btnColor: Colors.grey[800], // TODO theme
          ),
          AppDialogAction(
            onPressed: () async {
              await _submitResetPassword();
            },
            text: 'Submit',
          ),
        ],
      ),
    );
  }
}

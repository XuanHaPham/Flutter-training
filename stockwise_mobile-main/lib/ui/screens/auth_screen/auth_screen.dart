import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:stockwise_mobile/core/viewmodels/commons/interfaces/iauth_viewmodel.dart';
import 'package:stockwise_mobile/ui/commons/app_button.dart';
import 'package:stockwise_mobile/ui/commons/dialog_forgot_password.dart';
import 'package:stockwise_mobile/ui/commons/expandable_page_view.dart';
import 'package:stockwise_mobile/ui/commons/keyboard_unfocus_wrapper.dart';
import 'package:stockwise_mobile/ui/commons/text_with_line.dart';
import 'package:stockwise_mobile/utils/hero_utils.dart';
import 'package:stockwise_mobile/utils/regex_utils.dart';
import 'package:stockwise_mobile/utils/url_utils.dart';

part 'widgets/auth_common_widgets.dart';
part 'widgets/login_form_box.dart';
part 'widgets/signup_form_box.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({
    Key key,
  }) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  PageController _pageController = PageController();

  final _textEmailController = TextEditingController();
  final _textLoginPasswordController = TextEditingController();
  final _textSignUpPasswordController = TextEditingController();
  final _textSignUpRepeatPasswordController = TextEditingController();

  @override
  void dispose() {
    _pageController.dispose();
    _textEmailController.dispose();
    _textLoginPasswordController.dispose();
    _textSignUpPasswordController.dispose();
    _textSignUpRepeatPasswordController.dispose();
    super.dispose();
  }

  Future<void> switchToForm(AuthForm authForm) async {
    int pageToSwitch = authForm == AuthForm.login ? 0 : 1;
    await _pageController.animateToPage(
      pageToSwitch,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardUnfocusWrapper(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue[900],
                Colors.indigo[900],
              ],
            ),
          ),
          child: SafeArea(
            child: Container(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  // Logo
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Hero(
                      tag: HeroUtils.logoWithTextTag,
                      child: SvgPicture.asset(
                        'assets/images/logo/logo_with_text.svg',
                        height: 40,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  // Form box
                  ExpandablePageView(
                    controller: _pageController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: _LoginFormBox(
                          textEmailController: _textEmailController,
                          textLoginPasswordController:
                              _textLoginPasswordController,
                          switchFormHandler: () {
                            switchToForm(AuthForm.signup);
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: _SignupFormBox(
                          textEmailController: _textEmailController,
                          textSignUpPasswordController:
                              _textSignUpPasswordController,
                          textSignUpRepeatPasswordController:
                              _textSignUpRepeatPasswordController,
                          switchFormHandler: () {
                            switchToForm(AuthForm.login);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum AuthForm {
  login,
  signup,
}

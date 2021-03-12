part of '../auth_screen.dart';

class _SignupFormBox extends StatefulWidget {
  final TextEditingController textEmailController;
  final TextEditingController textSignUpPasswordController;
  final TextEditingController textSignUpRepeatPasswordController;
  final Function switchFormHandler;

  _SignupFormBox({
    Key key,
    @required this.textEmailController,
    @required this.textSignUpPasswordController,
    @required this.textSignUpRepeatPasswordController,
    @required this.switchFormHandler,
  }) : super(key: key);

  @override
  __SignupFormBoxState createState() => __SignupFormBoxState();
}

class __SignupFormBoxState extends State<_SignupFormBox> {
  IAuthViewmodel _authViewmodel;

  final _formKey = GlobalKey<FormState>();
  final _focusNodeEmail = FocusNode();
  final _focusNodePassword = FocusNode();
  final _focusNodeRepeatPassword = FocusNode();

  bool _isShowPassword = false;

  @override
  void initState() {
    super.initState();

    _authViewmodel = context.read<IAuthViewmodel>();
  }

  @override
  void dispose() {
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    _focusNodeRepeatPassword.dispose();
    super.dispose();
  }

  void _togglePasswordObscure() {
    setState(() {
      _isShowPassword = !_isShowPassword;
    });
  }

  Future<void> _signUp() async {
    if (!_validateForm()) {
      return;
    }

    await _authViewmodel.signUp(
      widget.textEmailController.text,
      widget.textSignUpPasswordController.text,
    );
  }

  bool _validateForm() {
    return _formKey.currentState.validate();
  }

  String _validatorEmail(String value) {
    if (!RegexUtils.emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  String _validatorPassword(String value) {
    if (value == '') {
      return 'Password cannot be empty';
    }

    if (!RegexUtils.passwordRegex.hasMatch(value)) {
      return 'Password requires at least 6 characters';
    }

    return null;
  }

  String _validatorRepeatPassword(String value) {
    if (widget.textSignUpPasswordController.text != value) {
      return 'Password does not match';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              'Welcome to Stockwise',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: widget.textEmailController,
              focusNode: _focusNodeEmail,
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
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_focusNodePassword);
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: widget.textSignUpPasswordController,
              focusNode: _focusNodePassword,
              obscureText: !_isShowPassword,
              style: TextStyle(
                fontSize: 14,
              ),
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(),
                labelText: 'Password',
                prefixIcon: Icon(Ionicons.md_lock),
                suffixIcon: IconButton(
                  onPressed: () {
                    _togglePasswordObscure();
                  },
                  icon: Icon(
                    _isShowPassword ? Ionicons.md_eye_off : Ionicons.md_eye,
                  ),
                ),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: _validatorPassword,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_focusNodeRepeatPassword);
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: widget.textSignUpRepeatPasswordController,
              focusNode: _focusNodeRepeatPassword,
              obscureText: true,
              style: TextStyle(
                fontSize: 14,
              ),
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(),
                labelText: 'Repeat Password',
                prefixIcon: Icon(Ionicons.md_lock),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: _validatorRepeatPassword,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) async {
                await _signUp();
              },
            ),
            SizedBox(height: 25),
            Container(
              width: double.infinity,
              child: AppButton(
                onPressed: () async {
                  await _signUp();
                },
                child: Text('Sign Up'),
              ),
            ),
            SizedBox(height: 10),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Already have an account?',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                  TextSpan(
                    text: ' Login',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        widget.switchFormHandler();
                      },
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: TextWithLine(text: 'OR CONNECT WITH'),
            ),
            _OAuth2Section(),
            SizedBox(height: 20),
            _TermSentence(),
          ],
        ),
      ),
    );
  }
}

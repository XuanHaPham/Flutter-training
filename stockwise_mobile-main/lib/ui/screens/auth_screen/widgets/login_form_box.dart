part of '../auth_screen.dart';

class _LoginFormBox extends StatefulWidget {
  final TextEditingController textEmailController;
  final TextEditingController textLoginPasswordController;
  final Function switchFormHandler;

  _LoginFormBox({
    Key key,
    @required this.textEmailController,
    @required this.textLoginPasswordController,
    @required this.switchFormHandler,
  }) : super(key: key);

  @override
  __LoginFormBoxState createState() => __LoginFormBoxState();
}

class __LoginFormBoxState extends State<_LoginFormBox> {
  IAuthViewmodel _authViewmodel;

  final _formKey = GlobalKey<FormState>();
  final _focusNodeEmail = FocusNode();
  final _focusNodePassword = FocusNode();

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
    print('dispose ne');
    super.dispose();
  }

  void _togglePasswordObscure() {
    setState(() {
      _isShowPassword = !_isShowPassword;
    });
  }

  Future<void> _login() async {
    if (!_validateForm()) {
      return;
    }

    await _authViewmodel.signInWithEmailAndPassword(
      widget.textEmailController.text,
      widget.textLoginPasswordController.text,
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
          mainAxisSize: MainAxisSize.min,
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
              controller: widget.textLoginPasswordController,
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
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) async {
                await _login();
              },
            ),
            SizedBox(height: 10),
            Container(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Get.dialog(DialogForgotPassword());
                },
                child: Text(
                  'Forgot password',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              child: AppButton(
                onPressed: () async {
                  await _login();
                },
                child: Text('Login'),
              ),
            ),
            SizedBox(height: 10),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Don\'t have an account?',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                  TextSpan(
                    text: ' Sign Up',
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

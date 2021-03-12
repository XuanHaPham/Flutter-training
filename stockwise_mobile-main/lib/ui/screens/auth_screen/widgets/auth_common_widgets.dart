part of '../auth_screen.dart';

class _OAuth2Section extends StatefulWidget {
  const _OAuth2Section({Key key}) : super(key: key);

  @override
  __OAuth2SectionState createState() => __OAuth2SectionState();
}

class __OAuth2SectionState extends State<_OAuth2Section> {
  IAuthViewmodel _authViewmodel;

  @override
  void initState() {
    super.initState();

    _authViewmodel = context.read<IAuthViewmodel>();
  }

  Future<void> _googleSignInPressed() async {
    await _authViewmodel.signInWithGoogle();
  }

  Future<void> _facebookSignInPressed() async {
    await _authViewmodel.signInWithFacebook();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: _buildButton(
              onPressed: () async {
                await _facebookSignInPressed();
              },
              btnColor: Color.fromRGBO(59, 89, 152, 1),
              iconData: Zocial.facebook,
              text: 'FACEBOOK',
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: _buildButton(
              onPressed: () async {
                await _googleSignInPressed();
              },
              btnColor: Color.fromRGBO(217, 55, 43, 1),
              iconData: Zocial.google,
              text: 'GOOGLE',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    @required Function onPressed,
    @required Color btnColor,
    @required IconData iconData,
    @required String text,
  }) {
    return AppButton(
      onPressed: onPressed,
      btnColor: btnColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData),
          SizedBox(width: 5),
          Text(text),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}

class _TermSentence extends StatelessWidget {
  const _TermSentence({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          color: Colors.grey[800],
        ),
        children: [
          TextSpan(
            text: 'Using our app means you agree to our ',
          ),
          TextSpan(
            text: 'Terms of Service',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                UrlUtils.launchUrl('https://www.apheleia.me/legal');
              },
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: ' and ',
          ),
          TextSpan(
            text: 'Privacy Policy',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                UrlUtils.launchUrl('https://www.apheleia.me/legal');
              },
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

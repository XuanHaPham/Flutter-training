import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stockwise_mobile/core/viewmodels/commons/interfaces/iauth_viewmodel.dart';
import 'package:stockwise_mobile/utils/hero_utils.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  IAuthViewmodel _authViewmodel;

  @override
  void initState() {
    super.initState();

    _authViewmodel = context.read<IAuthViewmodel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        title: Consumer<IAuthViewmodel>(
          builder: (_, __, ___) {
            return Text('Hello ${_authViewmodel.currentUser?.email}');
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: HeroUtils.logoWithTextTag,
            child: SvgPicture.asset(
              'assets/images/logo/logo_with_text.svg',
              height: 60,
            ),
          ),
          RaisedButton(
            onPressed: () {
              _authViewmodel.signOut();
            },
            child: Text('Sign out'),
          ),
        ],
      ),
    );
  }
}

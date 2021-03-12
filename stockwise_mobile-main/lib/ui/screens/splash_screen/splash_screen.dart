import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stockwise_mobile/core/viewmodels/commons/interfaces/iauth_viewmodel.dart';
import 'package:stockwise_mobile/core/viewmodels/commons/interfaces/itheme_viewmodel.dart';
import 'package:stockwise_mobile/global/global_data.dart';
import 'package:stockwise_mobile/global/locator/locator.dart';
import 'package:stockwise_mobile/global/app_router.dart';
import 'package:stockwise_mobile/utils/hero_utils.dart';
import 'package:stockwise_mobile/utils/navigation_utils.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({
    Key key,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _globalData = locator<GlobalData>();
  IAuthViewmodel _authViewmodel;
  IThemeViewmodel _themeViewmodel;
  @override
  void initState() {
    super.initState();

    _authViewmodel = context.read<IAuthViewmodel>();
    _themeViewmodel = context.read<IThemeViewmodel>();

    Future.delayed(Duration.zero, () async {
      await _init();
    });
  }

  Future<void> _init() async {
    _authViewmodel.initUser();
    await _themeViewmodel.initTheme();

    await Future.delayed(Duration(seconds: 3));

    if (_globalData.currentUser != null) {
      NavigationUtils.navigateOff(AppRouter.home);
    } else {
      NavigationUtils.navigateOff(AppRouter.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Stack(
          children: [
            Center(
              child: Hero(
                tag: HeroUtils.logoWithTextTag,
                child:
                    SvgPicture.asset('assets/images/logo/logo_with_text.svg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

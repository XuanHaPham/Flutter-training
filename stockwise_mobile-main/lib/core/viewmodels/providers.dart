import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stockwise_mobile/core/viewmodels/commons/implements/auth_viewmodel.dart';
import 'package:stockwise_mobile/core/viewmodels/commons/implements/theme_viewmodel.dart';
import 'package:stockwise_mobile/core/viewmodels/commons/interfaces/iauth_viewmodel.dart';
import 'package:stockwise_mobile/core/viewmodels/commons/interfaces/itheme_viewmodel.dart';
import 'package:stockwise_mobile/core/viewmodels/screens/implements/auth_screen_viewmodel.dart';
import 'package:stockwise_mobile/core/viewmodels/screens/interfaces/iauth_screen_viewmodel.dart';

List<SingleChildWidget> viewmodelProviders = [
  // Commons
  ChangeNotifierProvider<IThemeViewmodel>(
    create: (_) => ThemeViewmodel(),
  ),
  ChangeNotifierProvider<IAuthViewmodel>(
    create: (_) => AuthViewmodel(),
  ),

  // Screens
  ChangeNotifierProvider<IAuthScreenViewmodel>(
    create: (_) => AuthScreenViewmodel(),
  ),
];

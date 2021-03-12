import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:stockwise_mobile/core/viewmodels/commons/interfaces/itheme_viewmodel.dart';
import 'package:stockwise_mobile/core/viewmodels/providers.dart';
import 'package:stockwise_mobile/global/app_router.dart';
import 'package:stockwise_mobile/startups/init_firebase.dart';
import 'package:stockwise_mobile/startups/init_locator.dart';
import 'package:stockwise_mobile/startups/init_precache_images.dart';
import 'package:stockwise_mobile/utils/navigation_utils.dart';

Future<void> mainDelegate() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Pre-init
  await setupLocator();
  await initPrecacheImages();
  await initFirebase();

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => _MyApp(),
    ),
  );
}

class _MyApp extends StatefulWidget {
  _MyApp({Key key}) : super(key: key);

  @override
  __MyAppState createState() => __MyAppState();
}

class __MyAppState extends State<_MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...viewmodelProviders],
      child: Consumer<IThemeViewmodel>(builder: (_, themeViewmodel, ___) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          navigatorKey: NavigationUtils.navigatorKey,
          onGenerateRoute: (settings) => MyRouterUtils.generateRoute(settings),
          initialRoute: AppRouter.splash,
          navigatorObservers: [HeroController()],
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.blue[900],
            disabledColor: Colors.grey[400],
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.yellow,
            disabledColor: Colors.grey[400],
          ),
          themeMode: themeViewmodel.currentThemeMode,
        );
      }),
    );
  }
}

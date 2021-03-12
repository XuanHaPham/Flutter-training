import 'package:demoTabBar/Left_page_2.dart';
import 'package:demoTabBar/ileft_viewmodel.dart';
import 'package:demoTabBar/left_page.dart';
import 'package:demoTabBar/left_viewmodel.dart';
import 'package:demoTabBar/provider.dart';
import 'package:demoTabBar/right_page.dart';
import 'package:demoTabBar/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> { 
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ILeftViewmodel>(create: (_) => LeftViewmodel(),),
      ],
      child: Scaffold(
        appBar: AppBar(),
        body:Consumer<ILeftViewmodel>(
          builder: (_,vm,___) {
            return Stack(
            children: <Widget>[
              Offstage(
                offstage: vm.index != 0,
                child: TickerMode(
                  enabled: vm.index == 0,
                  child: MaterialApp(initialRoute: Router.left,
                    onGenerateRoute: (settings) => Router.generateRoute(settings),),
                ),
              ),
              Offstage(
                offstage: vm.index != 1,
                child: TickerMode(
                  enabled: vm.index == 1,
                  child: MaterialApp(initialRoute: Router.right,
              onGenerateRoute: (settings) => Router.generateRoute(settings),),
                ),
              ),
            ],
          );
        }
      ),
      bottomNavigationBar:CustomBottomNavigationBar ()
    )
  
    
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  CustomBottomNavigationBar({Key key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  void _onItemTap(int index) {
    switch (index) {
      case 0:
        // Navigate
        break;
      case 1:
        // Toggle List View
        break;
      case 2:
        // Refresh
        break;
      case 3:
        // Lock screen
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: Provider.of<ILeftViewmodel>(context, listen: false).index,
      onTap: (index) { _onItemTap(index); },
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home, color: Colors.black,),
          title: new Text('Change Journey', style: TextStyle(color: Colors.black),),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.home, color: Colors.black,),
          title: new Text('List View', style: TextStyle(color: Colors.black),),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.home, color: Colors.black,),
          title: new Text('Refresh', style: TextStyle(color: Colors.black),),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.home, color: Colors.black,),
          title: new Text('Lock', style: TextStyle(color: Colors.black),),
        ),
      ],
    );
  }
}
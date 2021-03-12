import 'package:BottomBarAnimation/Food.dart';
import 'package:BottomBarAnimation/Home.dart';
import 'package:BottomBarAnimation/Weather.dart';
import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  int currentPage = 0;
  final _pageOptions = [Home(), Weather(), Food()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BubbledNavigationBar(
        defaultBubbleColor: Colors.blue,
        onTap: (index) {
          // handle tap
        },
        items: <BubbledNavigationBarItem>[
          BubbledNavigationBarItem(
            icon: Icon(CupertinoIcons.home, size: 30, color: Colors.red),
            activeIcon:
                Icon(CupertinoIcons.home, size: 30, color: Colors.white),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          BubbledNavigationBarItem(
            icon: Icon(CupertinoIcons.phone, size: 30, color: Colors.purple),
            activeIcon:
                Icon(CupertinoIcons.phone, size: 30, color: Colors.white),
            title: Text(
              'Phone',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          BubbledNavigationBarItem(
            icon: Icon(CupertinoIcons.info, size: 30, color: Colors.teal),
            activeIcon:
                Icon(CupertinoIcons.info, size: 30, color: Colors.white),
            title: Text(
              'Info',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          BubbledNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled,
                size: 30, color: Colors.cyan),
            activeIcon: Icon(CupertinoIcons.profile_circled,
                size: 30, color: Colors.white),
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.blue,
      ),
    );
  }
}

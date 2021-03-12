import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return const Text(
                "Loading....",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              );
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ...snapshot.data.docs.map((user) => _buildListItem(user)),
              ],
            );
          }),
    );
  }

  Widget _buildListItem(DocumentSnapshot user) {
    return Container(
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      height: 50,
      margin: EdgeInsets.only(left: 15, bottom: 10, right: 10),
      padding: EdgeInsets.only(left: 10),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              user['name'],
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.green[900],
                fontSize: 18,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              user['address'],
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.green[900],
                fontSize: 18,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              user['email'],
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.green[900],
                fontSize: 18,
              ),
            ),
            InkWell(
              onTap: () {
                user.reference.update({
                  'count': user['count'] + 1
                });
              },
              child: Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.only(right: 10),
                color: Colors.white,
                child: Center(
                  child: Text(
                    user['count'].toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.green[900],
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<User> user_list = [
  User(address: "HCM", email: "a@gmail,com", name: "Xuanha"),
  User(address: "HCM", email: "a@gmail,com", name: "Xuanha"),
  User(address: "HCM", email: "a@gmail,com", name: "Xuanha"),
  User(address: "HCM", email: "a@gmail,com", name: "Xuanha"),
  User(address: "HCM", email: "a@gmail,com", name: "Xuanha"),
];

class User {
  String name;
  String address;
  String email;
  User({this.address, this.email, this.name});
}

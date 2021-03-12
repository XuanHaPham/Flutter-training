import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  List<Widget> _buildFAQs() {
    
    return FAQs.map((f) => 
      ExpansionTile(
        title: Text(
          f.question,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500
          ),
        ),
        children: <Widget>[
          ListTile(
            title: Text(
              f.answear
            ),
          )
        ],
      ),
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: ListView(
          children: _buildFAQs(),
        ), // This trailing comma makes auto-formatting nicer for build methods.
    ),
    );
  }
}

class FAQ {
  String id;
  String question;
  String answear;
  FAQ(this.question, this.answear);
}

final List<FAQ> FAQs = [
FAQ('What should I consider when placing an order?', 'Orders can only be assigned correctly if all travel data (current date, train, car & seat number) have been entered correctly.'),
FAQ('What should I consider when placing an order?', 'Orders can only be assigned correctly if all travel data (current date, train, car & seat number) have been entered correctly.'),
FAQ('What should I consider when placing an order?', 'Orders can only be assigned correctly if all travel data (current date, train, car & seat number) have been entered correctly.'),
FAQ('What should I consider when placing an order?', 'Orders can only be assigned correctly if all travel data (current date, train, car & seat number) have been entered correctly.'),
];
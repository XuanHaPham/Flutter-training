import 'package:flutter/material.dart';

class TestScreenArguments {
  final String title;

  const TestScreenArguments({
    @required this.title,
  });
}

class TestScreen extends StatefulWidget {
  final TestScreenArguments arguments;

  TestScreen({
    Key key,
    @required this.arguments,
  }) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test ${widget.arguments.title}'),
      ),
      body: Text('hi'),
    );
  }
}

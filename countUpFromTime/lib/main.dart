import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  int _counter = 0;
  String fromDate = "2020-10-28T03:30:53+00:00";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _CountUpTimer(
              fromTime: DateTime.parse(
                fromDate,
              ),
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class _CountUpTimer extends StatefulWidget {
  final DateTime fromTime;
  _CountUpTimer({Key key, this.fromTime}) : super(key: key);

  @override
  _CountUpTimerState createState() => _CountUpTimerState();
}

class _CountUpTimerState extends State<_CountUpTimer> {
  static const duration = const Duration(seconds: 1);
  Timer _timer;
  String timeCounter;
  @override
  void initState() {
    super.initState();
    setTimeCounter();
    _timer = new Timer.periodic(
      duration,
      (Timer timer) => setTimeCounter(),
    );
  }

  void setTimeCounter() {
    setState(
      () {
        var differenCounter = DateTime.now().difference(widget.fromTime);
        String twoDigits(int n) => n.toString().padLeft(2, "0");
        String twoDigitMinutes =
            twoDigits(differenCounter.inMinutes.remainder(60));
        String twoDigitSeconds =
            twoDigits(differenCounter.inSeconds.remainder(60));
        timeCounter =
            "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        timeCounter,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'content.dart';
import 'sample.dart';
import 'sample2.dart';

// Application entry-point
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  _openWidget(BuildContext context, Widget widget) =>
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => widget),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.amber,
        body: Builder(
          builder: (myContext) => Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RaisedButton(
                    child: Text("Full Screen form"),
                    onPressed: () => _openWidget(
                      myContext,
                      ScaffoldTest(),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RaisedButton(
                    child: Text("Dialog form"),
                    onPressed: () => _openWidget(
                      myContext,
                      DialogTest(),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RaisedButton(
                    child: Text("Custom Sample 1"),
                    onPressed: () => _openWidget(
                      myContext,
                      Sample(),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RaisedButton(
                    child: Text("Custom Sample 2"),
                    onPressed: () => _openWidget(
                      myContext,
                      Sample2(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Displays our [TextField]s in a [Scaffold] with a [FormKeyboardActions].
class ScaffoldTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Keyboard Actions Sample"),
      ),
      body: Content(),
    );
  }
}

/// Displays our [FormKeyboardActions] nested in a [AlertDialog].
class DialogTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Keyboard Actions Sample"),
      ),
      body: Center(
        child: FlatButton(
          color: Colors.blue,
          child: Text('Launch dialog'),
          onPressed: () => _launchInDialog(context),
        ),
      ),
    );
  }

  void _launchInDialog(BuildContext context) async {
    final height = MediaQuery.of(context).size.height / 3;
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Dialog test'),
          content: SizedBox(
            height: height,
            child: Content(
              isDialog: true,
            ),
          ),
          actions: [
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
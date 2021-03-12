import 'package:flutter/material.dart';

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
  int _counter = 0;

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
      body: Column(
        children: [
          Container(
              height: 240,
              width: 300,
              child: Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      TicketClipWrapper(
                        clipShadows: [
                          ClipShadow(color: Colors.black54, elevation: 5),
                        ],
                        radiusTopLeft: 0,
                        radiusTopRight: 0,
                        radiusBottomLeft: 10,
                        radiusBottomRight: 10,
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(230, 235, 255, 1)),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: 20),
                                  alignment: Alignment.centerLeft,
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Text(
                                    'Order Detail',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      TicketClipWrapper(
                        clipShadows: [
                          ClipShadow(color: Colors.black54, elevation: 5),
                        ],
                        radiusTopLeft: 10,
                        radiusTopRight: 10,
                        radiusBottomLeft: 10,
                        radiusBottomRight: 10,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(230, 235, 255, 1)),
                          child: Column(
                            children: <Widget>[
                              Text('data In order to run your application, type type '),
                              Text('data In order to run your application, type type '),
                              Text('data In order to run your application, type type '),
                              Text('data In order to run your application, type type '),
                              Text('data In order to run your application, type type '),
                              Text('data In order to run your application, type type '),
                              Text('data In order to run your application, type type '),
                              Text('data In order to run your application, type type '),
                              Text('data In order to run your application, type type '),
                              Text('data In order to run your application, type type '),
                              Text('data In order to run your application, type type '),
                              Text('data In order to run your application, type type '),
                              Text('data In order to run your application, type type '),
                              Text('data In order to run your application, type type '),
                              Text('data In order to run your application, type type '),
                              Text('data In order to run your application, type type '),
                              Text('data In order to run your application, type type '),
                            ],
                          ),
                        ),
                      ),
                      TicketClipWrapper(
                        clipShadows: [
                          ClipShadow(color: Colors.black54, elevation: 5),
                        ],
                        radiusTopLeft: 10,
                        radiusTopRight: 10,
                        radiusBottomLeft: 0,
                        radiusBottomRight: 0,
                        child: Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(230, 235, 255, 1)),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 14,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            'TOTAL AMOUNT',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.grey[800]),
                                          ),
                                          Expanded(
                                            child: Text(
                                              '£12.00',
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  color: Colors.grey[800]),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Notes: ',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[800]),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          SizedBox(height: 20,),
          Container(
            height: 250,
            width: 200,
            child: ListView(
              children: [
                Text('data In order to run your application, type type '),
                Text('data In order to run your application, type type '),
                Text('data In order to run your application, type type '),
                Text('data In order to run your application, type type '),
                Text('data In order to run your application, type type '),
                Text('data In order to run your application, type type '),
                Text('data In order to run your application, type type '),
                Text('data In order to run your application, type type '),
                Text('data In order to run your application, type type '),
                Text('data In order to run your application, type type '),
                Text('data In order to run your application, type type '),
                Text('data In order to run your application, type type '),
                Text('data In order to run your application, type type '),
                Text('data In order to run your application, type type '),
                Text('data In order to run your application, type type '),
                Text('data In order to run your application, type type '),
                Text('data In order to run your application, type type '),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TicketClipWrapper extends StatelessWidget {
  const TicketClipWrapper(
      {Key key, @required this.radiusTopLeft, @required this.radiusBottomLeft, @required this.radiusBottomRight, @required this.radiusTopRight, this.child, this.clipShadows = const []})
      : super(key: key);

  ///The widget that is going to be clipped as ticket shape
  final Widget child;

  ///The radius of the circle that is used to clip corners of the [child]
  final double radiusTopLeft;
  final double radiusTopRight;
  final double radiusBottomLeft;
  final double radiusBottomRight;
  
  ///List of shadows to be cast on the border
  final List<ClipShadow> clipShadows;

  @override
  Widget build(BuildContext context) {
    var clipper = TicketClipper(radiusBottomLeft, radiusBottomRight, radiusTopLeft, radiusTopRight);
    return CustomPaint(
      painter: ClipShadowPainter(clipper, clipShadows),
      child: ClipPath(
        clipper: clipper,
        child: child,
      ),
    );
  }
}


class TicketClipper extends CustomClipper<Path> {
  TicketClipper(this.radiusBottomLeft, this.radiusBottomRight, this.radiusTopLeft, this.radiusTopRight);

  final double radiusTopLeft;
  final double radiusTopRight;
  final double radiusBottomLeft;
  final double radiusBottomRight;

  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(radiusTopLeft, 0.0);
    path.arcToPoint(Offset(0.0, radiusTopLeft),
        clockwise: true, radius: Radius.circular(radiusTopLeft));
    path.lineTo(0.0, size.height - radiusBottomLeft);
    path.arcToPoint(Offset(radiusBottomLeft, size.height),
        clockwise: true, radius: Radius.circular(radiusBottomLeft));
    path.lineTo(size.width - radiusBottomRight, size.height);
    path.arcToPoint(Offset(size.width, size.height - radiusBottomRight),
        clockwise: true, radius: Radius.circular(radiusBottomRight));
    path.lineTo(size.width, radiusTopRight);
    path.arcToPoint(Offset(size.width - radiusTopRight, 0.0),
        clockwise: true, radius: Radius.circular(radiusTopRight));

    /*..addOval(Rect.fromCircle(center: Offset.zero, radius: radius))
      ..addOval(
          Rect.fromCircle(center: Offset(size.width, 0.0), radius: radius))
      ..addOval(Rect.fromCircle(
          center: Offset(size.width, size.height), radius: radius))
      ..addOval(
          Rect.fromCircle(center: Offset(0.0, size.height), radius: radius))
      ..addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height))
      ..fillType = PathFillType.evenOdd;*/
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class ClipShadowPainter extends CustomPainter {
  final CustomClipper<Path> clipper;
  final List<ClipShadow> clipShadows;

  ClipShadowPainter(this.clipper, this.clipShadows);

  @override
  void paint(Canvas canvas, Size size) {
    clipShadows.forEach((ClipShadow shadow) {
      canvas.drawShadow(
          clipper.getClip(size), shadow.color, shadow.elevation, true);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ClipShadow {
  final Color color;
  final double elevation;

  ClipShadow({@required this.color, this.elevation = 5});
}
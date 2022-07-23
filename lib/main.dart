import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

    return MaterialApp(
      title: 'Daemon Rooms',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Daemon Rooms'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    const borderSize = 1.0;
    const itemsCount = 5.0;
    var width =
        (MediaQuery.of(context).size.width - (itemsCount - 1) * borderSize) / 5;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Row(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Color.fromARGB(255, 97, 97, 97),
                    width: borderSize,
                  ),
                ),
                image: DecorationImage(
                  image: new AssetImage('assets/images/game_1.jpg'),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red,
                  ),
                  BoxShadow(
                    color: Colors.red,
                    spreadRadius: -12.0,
                    blurRadius: 12.0,
                  ),
                ],
              ),
              child: Container(
                width: width,
                height: height,
              )),
          Container(
              decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Color.fromARGB(255, 97, 97, 97),
                      width: borderSize,
                    ),
                  ),
                  image: DecorationImage(
                    image: new AssetImage('assets/images/game_2.jpg'),
                    fit: BoxFit.cover,
                    colorFilter:
                        ColorFilter.mode(Colors.grey, BlendMode.saturation),
                  )),
              child: Container(
                width: width,
                height: height,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.lock_outline_rounded,
                          color: Color.fromARGB(255, 255, 255, 255),
                          size: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Container(
              decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Color.fromARGB(255, 97, 97, 97),
                      width: borderSize,
                    ),
                  ),
                  image: DecorationImage(
                    image: new AssetImage('assets/images/game_3.jpg'),
                    fit: BoxFit.cover,
                    colorFilter:
                        ColorFilter.mode(Colors.grey, BlendMode.saturation),
                  )),
              child: Container(
                width: width,
                height: height,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.lock_outline_rounded,
                          color: Color.fromARGB(255, 255, 255, 255),
                          size: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Container(
              decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Color.fromARGB(255, 97, 97, 97),
                      width: borderSize,
                    ),
                  ),
                  image: DecorationImage(
                    image: new AssetImage('assets/images/game_4.jpg'),
                    fit: BoxFit.cover,
                    colorFilter:
                        ColorFilter.mode(Colors.grey, BlendMode.saturation),
                  )),
              child: Container(
                width: width,
                height: height,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.lock_outline_rounded,
                          color: Color.fromARGB(255, 255, 255, 255),
                          size: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: new AssetImage('assets/images/game_5.jpg'),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.grey, BlendMode.saturation),
              )),
              child: Container(
                width: width,
                height: height,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.lock_outline_rounded,
                          color: Color.fromARGB(255, 255, 255, 255),
                          size: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 178, 178, 178)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(0, 0);
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width * 0.5, size.height);
    path0.lineTo(size.width * -0.5, size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

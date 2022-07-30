import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vadim_artem_app/unityPage.dart';

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
  void onGamePressed() async {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => UnityTestingWrapper()));
  }

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
              boxShadow: [
                BoxShadow(
                    color: Colors.red,
                    blurRadius: 10,
                    spreadRadius: 15,
                    offset: Offset(0, 7)),
              ],
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
            ),
            child: new GestureDetector(
                onTap: onGamePressed,
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.red,
                            offset: Offset(4.0, 4.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0),
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4.0, -4.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0),
                      ],
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.red,
                            Colors.red,
                            Colors.red,
                            Colors.red,
                          ],
                          stops: [
                            0.1,
                            0.3,
                            0.8,
                            1
                          ])),
                  width: width,
                  height: height,
                )),
          ),
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

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

var difficultyOptions = [
  'EASY',
  'MEDIUM',
  'HARD',
];

var languageOptions = [
  'ENG',
  'RU',
];

class _MyHomePageState extends State<MyHomePage> {
  void onGamePressed() async {
    print('touch');
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => UnityTestingWrapper()));
  }

  String difficultyValue = difficultyOptions[0];
  String languageValue = languageOptions[0];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const borderSize = 1.0;
    const itemsCount = 5.0;
    var width =
        (MediaQuery.of(context).size.width - (itemsCount - 1) * borderSize) / 5;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      drawerEdgeDragWidth: 30,
      body: Stack(
        children: <Widget>[
          new Row(
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
                    behavior: HitTestBehavior.translucent,
                    child: Container(
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
          new Positioned(
            left: 0,
            top: height / 2 - 75,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.95),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0)),
              ),
              width: 22,
              height: 150,
              child: Icon(
                Icons.double_arrow_rounded,
                color: Color.fromRGBO(112, 113, 118, 1),
                size: 20,
              ),
            ),
          ),
        ],
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(0, 0, 0, 1).withOpacity(0.85),
          disabledColor: Colors.white,
        ),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 69,
                child: DrawerHeader(
                  child: Text('Options'.toUpperCase(),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center),
                  margin: EdgeInsets.all(0.0),
                  padding: EdgeInsets.only(top: 40),
                ),
              ),
              Container(
                height: double.maxFinite,
                padding: EdgeInsets.only(left: 16, top: 16),
                child: Column(children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Text(
                          'DIFFICULTY:',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      DropdownButton<String>(
                        style: TextStyle(color: Colors.white, fontSize: 13),
                        value: difficultyValue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: difficultyOptions.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            difficultyValue = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Text(
                            'LANGUAGE:',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        DropdownButton<String>(
                          style: TextStyle(color: Colors.white, fontSize: 13),
                          value: languageValue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: languageOptions.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              languageValue = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

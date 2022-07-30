import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:flutter/services.dart';
import 'package:vadim_artem_app/main.dart';

class UnityTestingWrapper extends StatefulWidget {
  UnityTestingState createState() => UnityTestingState();
}

class UnityTestingState extends State<UnityTestingWrapper> {
  late UnityWidgetController _unityWidgetController;
  double _sliderValue = 0.0;

  get onUnityMessage => null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
      home: Scaffold(
        body: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Stack(
            children: <Widget>[
              UnityWidget(
                onUnityCreated: onUnityCreated,
                fullscreen: true,
                borderRadius: BorderRadius.circular(10),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                width: 30,
                child: TextButton(
                    onPressed: goToMenu,
                    child: Text('+')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onUnityCreated(controller) {
    this._unityWidgetController = controller;
  }

  void goToMenu() async {
    _unityWidgetController.unload();

    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MyApp()));
  }

  void setRotationSpeed(String speed) {
    print(speed);

    _unityWidgetController.postMessage(
      'Cube',
      'SetRotationSpeed',
      speed.replaceAll('.', ','),
    );
  }
}

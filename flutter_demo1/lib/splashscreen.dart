import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_demo1/pertemuan1.dart';


class splashscreen extends StatefulWidget {
  splashscreen({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  startSplashScreen() async{
    var duration = new Duration(seconds: 2);
    return Timer(duration, () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>pertemuan1(title: "Fltuter SPLAH SCREEN"))
      );
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color(0xff329ef),
      body: Center(
        child: Image.asset(
          "images/logo.png",
              width: 200.0,
          height: 200.0,
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  @override
  void initState() {
    startSplashScreen();
  }
}

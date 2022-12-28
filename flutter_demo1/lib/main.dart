import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo1/home.dart';
import 'package:flutter_demo1/mahasiswa/mahasiswa_get.dart';
import 'package:flutter_demo1/pertemuan1.dart';
import 'package:flutter_demo1/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(new MaterialApp(home: SplashScreen()));
}


//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: splashscreen(title: 'Flutter Demo SplashScreen Page Buatan sendirii'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   /*void navigateLogin() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     int? isLogin = pref.getInt("is_login");
//     if (isLogin == 1) {
//       Navigator.pushReplacement
//         (context,
//           MaterialPageRoute(builder: (context) => pertemuan1(title: "Home")));
//     }
//   }*/
//
//   @override
//   void initState() {
//     //navigateLogin();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
//
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return new SplashScreen(
//   //     seconds:10,
//   //     navigateAfterSeconds: pertemuan1(title: 'Pertemuan1'),
//   //     title: new Text('contoh splash screen'),
//   //     image: Image.asset('images/logo.png'),
//   //     photoSize: 150.0,
//   //   );
//   // }



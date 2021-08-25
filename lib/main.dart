import 'package:app_ui3/pages/homePage.dart';
import 'package:app_ui3/pages/introPage.dart';
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
      ),
      home: IntroPage(),
      routes: {
        IntroPage.id: (context) => IntroPage(),
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}

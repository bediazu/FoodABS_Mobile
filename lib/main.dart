import 'package:flutter/material.dart';
import 'package:foodabs/pages/home_page.dart';
import 'package:foodabs/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {

        //TODO
    '/': (context) => LoginPage(),
    '/homePage': (context) => HomePage(),
  },
    );
  }
}
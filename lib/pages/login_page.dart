import 'package:flutter/material.dart';
import 'package:foodabs/widgets/login_body_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
                    body: MyLoginWidget());
  }
}

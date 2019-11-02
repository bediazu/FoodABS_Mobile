import 'package:flutter/material.dart';
import 'package:foodabs/colors/global_colors.dart';
import 'package:foodabs/shapes/app_bar_shape.dart';
import 'package:foodabs/styles/text_styles.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _appBar = PreferredSize(
      preferredSize: Size.fromHeight(260),
      child: ClipPath(
        clipper: AppBarShapeClipper(),
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  AppBar(
                    backgroundColor: Colors.red,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, bottom: 55.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Learn to design and code apps',
                            style: loginMessageTitle,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Complete courses about the best tools and design systems',
                            style: loginMessageSubTitle,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ));

  final _appBody = Container(
    color: loginBackgroundColor,
    child: Center(
        child: Stack(
      children: <Widget>[
        Positioned(
          left: 170,
          height: 280,
          width: 220,
          bottom: 200,
          child: Image.asset("assets/images/login.png"),
        ),
        ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 150, top: 50),
              child: Text(
                'Login In to',
                style: loginInTo,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Text(
                'Start...',
                style: startMessage,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 15.0,
                        offset: Offset(0.0, 0.75))
                  ],
                ),
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                          child: Icon(Icons.email, color: loginEmailColor),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 16.0),
                            child: TextField(
                              decoration: new InputDecoration(
                                  hintText: 'Email', hintStyle: hintEmailLogin),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                          child: Icon(
                            Icons.lock,
                            color: loginPasswordColor,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 12.0, right: 16.0, top: 16, bottom: 25),
                            child: TextField(
                              decoration: new InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: hintPasswordLogin),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    color: loginButton,
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Login ',
                          style: buttonLogin,
                        ),
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                      ],
                    ),
                    onPressed: () {},
                  ),
                  Row(
                    children: <Widget>[
                      RaisedButton(
                        color: loginGoogleButton,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.google,
                              size: 16,
                              color: loginGoogleIcon,
                            )
                          ],
                        ),
                        onPressed: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 32),
                        child: RaisedButton(
                          color: Colors.blue,
                          child: Row(
                            children: <Widget>[
                              Icon(FontAwesomeIcons.facebook,
                                  size: 16, color: loginFacebookIcon)
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ],
    )),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar, body: _appBody);
  }
}

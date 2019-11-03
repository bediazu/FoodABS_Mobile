import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodabs/colors/global_colors.dart';
import 'package:foodabs/models/classes/user.dart';
import 'package:foodabs/pages/home_page.dart';
import 'package:foodabs/shapes/app_bar_shape.dart';
import 'package:foodabs/styles/text_styles.dart';
import 'dart:math';

class MyLoginWidget extends StatefulWidget {
  @override
  _MyLoginWidgetState createState() => _MyLoginWidgetState();
}

class _MyLoginWidgetState extends State<MyLoginWidget> {
  double _offsetImage;
  double _offsetImageTop, _offsetImagePadding;

  String _currentTitle;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _offsetImage = 0;
    _offsetImageTop = 0;
    _offsetImagePadding = 0;

    _currentTitle = 'FoodABS';
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset <= 50) {
        setState(() {
          _offsetImage = _scrollController.offset;
          _offsetImageTop = max(20, _offsetImageTop - _scrollController.offset);
          _offsetImagePadding =
              max(10, _offsetImagePadding - _scrollController.offset);
          print(_scrollController.offset);
          _currentTitle = 'FoodABS';
        });
      } else {
        _currentTitle = 'Log In';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        Container(
          color: loginBackgroundColor,
          child: Column(
            children: <Widget>[
              ClipPath(
                clipper: AppBarShapeClipper(),
                child: Container(
                  height: height * 0.3,
                  color: Colors.red,
                  child: SafeArea(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, bottom: 50.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              _currentTitle,
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
                  ),
                ),
              ),
              Container(
                child: Expanded(
                  child: Stack(
                    children: <Widget>[
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.decelerate,
                        height: 170 + _offsetImage,
                        width: 170 + _offsetImage,
                        right: 30 + _offsetImage - 20,
                        top: 10 + _offsetImageTop,
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                              loginBackgroundColor.withOpacity(0.4),
                              BlendMode.dstATop),
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/images/login.png"))),
                          ),
                        ),
                      ),
                      ListView(
                        controller: _scrollController,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 32, right: 150, top: 50),
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
                            padding: const EdgeInsets.symmetric(
                                vertical: 60.0, horizontal: 25),
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
                                        padding: const EdgeInsets.only(
                                            left: 16.0, top: 16.0),
                                        child: Icon(Icons.email,
                                            color: loginEmailColor),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12.0, right: 16.0),
                                          child: TextField(
                                            decoration: new InputDecoration(
                                                hintText: 'Email',
                                                hintStyle: hintEmailLogin),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16.0, top: 16.0),
                                        child: Icon(
                                          Icons.lock,
                                          color: loginPasswordColor,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12.0,
                                              right: 16.0,
                                              top: 16,
                                              bottom: 25),
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
                          SizedBox(
                            height: _offsetImagePadding,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 32),
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
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (BuildContext context) => HomePage(user: User(name: 'Bruno D', uuid: '200'),)
                                    ));
                                  },
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
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 32),
                                      child: RaisedButton(
                                        color: Colors.blue,
                                        child: Row(
                                          children: <Widget>[
                                            Icon(FontAwesomeIcons.facebook,
                                                size: 16,
                                                color: loginFacebookIcon)
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

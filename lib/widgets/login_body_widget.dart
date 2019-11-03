import 'package:flutter/material.dart';
import 'package:foodabs/blocs/login_bloc/login_bloc.dart';
import 'package:foodabs/colors/global_colors.dart';
import 'package:foodabs/styles/text_styles.dart';
import 'package:foodabs/widgets/login/animated_picture_widget.dart';
import 'package:foodabs/widgets/login/form_login_widget.dart';
import 'dart:math';

import 'login/app_bar_login_widget.dart';
import 'login/buttons_login_widget.dart';

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  double _offsetImage;
  double _offsetImageTop, _offsetImagePadding;

  String _currentTitle;
  ScrollController _scrollController;

  final LoginBloc _loginBloc = LoginBloc();

  Widget _titleListView() => Padding(
        padding: const EdgeInsets.only(left: 32, right: 150, top: 50),
        child: Text(
          'Login In to',
          style: loginInTo,
        ),
      );

  Widget _subtitleListView() => Padding(
        padding: const EdgeInsets.only(left: 32.0),
        child: Text(
          'Start...',
          style: startMessage,
        ),
      );

  Widget _listView() => ListView(
        controller: _scrollController,
        children: <Widget>[
          _titleListView(),
          _subtitleListView(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 25),
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
              child: FormLogin(
                loginBloc: _loginBloc,
              ),
            ),
          ),
          SizedBox(height: _offsetImagePadding),
          ButtonsLogin(
              loginBloc: _loginBloc,
              emailController: _loginBloc.emailController,
              passwordController: _loginBloc.passwordController),
        ],
      );

  @override
  void initState() {
    super.initState();
    _offsetImage = 0;
    _offsetImageTop = 0;
    _offsetImagePadding = 0;

    _currentTitle = 'FoodABS';
    _scrollController = ScrollController();

    _loginBloc.emailController = TextEditingController();
    _loginBloc.passwordController = TextEditingController();

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
              MyAppBar(
                currentTitle: _currentTitle,
                height: height,
              ),
              Container(
                child: Expanded(
                  child: Stack(
                    children: <Widget>[
                      AnimatedPicture(
                        offsetImage: _offsetImage,
                        offsetImageTop: _offsetImageTop,
                      ),
                      _listView()
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

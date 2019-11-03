import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodabs/blocs/login_bloc/login_bloc.dart';
import 'package:foodabs/colors/global_colors.dart';
import 'package:foodabs/models/classes/user.dart';
import 'package:foodabs/pages/home_page.dart';
import 'package:foodabs/styles/text_styles.dart';

class ButtonsLogin extends StatelessWidget {
  final LoginBloc loginBloc;

  final TextEditingController emailController;
  final TextEditingController passwordController;

  const ButtonsLogin(
      {Key key, this.loginBloc, this.emailController, this.passwordController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              if (emailController.text.trim().isEmpty) {
                loginBloc.addEmail(passwordController.text.trim());
              }
              if (passwordController.text.trim().isEmpty) {
                loginBloc.addPassword(passwordController.text.trim());
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomePage(
                              user: User(name: 'Bruno D', uuid: '200'),
                            )));
              }
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
    );
  }
}

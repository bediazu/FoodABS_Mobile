import 'package:flutter/material.dart';
import 'package:foodabs/blocs/login_bloc/login_bloc.dart';
import 'package:foodabs/colors/global_colors.dart';
import 'package:foodabs/styles/text_styles.dart';


class FormLogin extends StatelessWidget {

  final LoginBloc loginBloc;

  FormLogin({this.loginBloc});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                padding: const EdgeInsets.only(left: 12.0, right: 16.0),
                child: StreamBuilder(
                  stream: loginBloc.emailStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: loginBloc.emailController,
                      decoration: new InputDecoration(
                          hintText: 'Email', hintStyle: hintEmailLogin),
                    );
                  },
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
                child: StreamBuilder(
                  stream: loginBloc.passwordStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: loginBloc.passwordController,
                      decoration: new InputDecoration(
                          hintText: 'Password', hintStyle: hintEmailLogin),
                    );
                  },
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

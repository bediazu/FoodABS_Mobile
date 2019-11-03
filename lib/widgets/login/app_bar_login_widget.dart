import 'package:flutter/material.dart';
import 'package:foodabs/shapes/app_bar_shape.dart';
import 'package:foodabs/styles/text_styles.dart';

class MyAppBar extends StatelessWidget {
  final String currentTitle;
  final double height;

  const MyAppBar({Key key, this.currentTitle, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AppBarShapeClipper(),
      child: Container(
        height: height * 0.3,
        color: Colors.red,
        child: SafeArea(
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    currentTitle,
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
    );
  }
}

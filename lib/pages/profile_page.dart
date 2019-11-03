import 'package:flutter/material.dart';
import 'package:foodabs/shapes/app_bar_profile_custom_painter.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return CustomPaint(
        painter: AppBarCurvePainter(),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                height: height * 0.3,
                width: width * 0.4,
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: height * 0.25,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                            "assets/images/profile/profile_avatar.png"),
                        backgroundColor: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

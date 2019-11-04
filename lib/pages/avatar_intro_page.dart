import 'package:flutter/material.dart';
import 'package:foodabs/colors/global_colors.dart';
import 'package:foodabs/models/classes/user.dart';

import 'package:foodabs/styles/text_styles.dart';

class AvatarIntroPage extends StatefulWidget {
  final User user;

  const AvatarIntroPage({Key key, this.user}) : super(key: key);
  @override
  _AvatarIntroPageState createState() => _AvatarIntroPageState();
}

class _AvatarIntroPageState extends State<AvatarIntroPage> {
  bool _white = false;
  double _selectedSliderOne = 0;
  double _selectedSliderTwo = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _white = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60.0, bottom: 60.0),
                  child: Container(
                    width: width * 0.4,
                    height: height * 0.3,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        color: Colors.white,
                        width: width * 0.4,
                        height: height * 0.25,
                        child: Hero(
                          tag: 'usuario',
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                                "assets/images/profile/profile_avatar.png"),
                            backgroundColor: homeBackgroundColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView(
                        children: <Widget>[
                          Material(
                            child: AnimatedOpacity(
                                duration: Duration(milliseconds: 400),
                                opacity: _white ? 1.0 : 0.0,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    'Top',
                                    style: avatarCategorie.copyWith(
                                        color: Colors.white),
                                  ),
                                )),
                            color: Colors.transparent,
                          ),
                          Material(
                            color: Colors.transparent,
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 400),
                              opacity: _white ? 1.0 : 0.0,
                                                          child: Slider(
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedSliderOne = newValue;
                                  });
                                },
                                value: _selectedSliderOne,
                                max: 100,
                                min: 0,
                                divisions: 4,
                                activeColor: Colors.blue,
                                inactiveColor: Colors.white,
                              ),
                            ),
                          ),
                          Material(
                            child: AnimatedOpacity(
                                duration: Duration(milliseconds: 400),
                                opacity: _white ? 1.0 : 0.0,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    'Accesories',
                                    style: avatarCategorie.copyWith(
                                        color: Colors.white),
                                  ),
                                )),
                            color: Colors.transparent,
                          ),
                          Material(
                            color: Colors.transparent,
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 400),
                              opacity: _white ? 1.0 : 0.0,
                                                          child: Slider(
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedSliderOne = newValue;
                                  });
                                },
                                value: _selectedSliderOne,
                                max: 100,
                                min: 0,
                                divisions: 4,
                                activeColor: Colors.green,
                                inactiveColor: Colors.white,
                              ),
                            ),
                          ),
                          Material(
                            child: AnimatedOpacity(
                                duration: Duration(milliseconds: 400),
                                opacity: _white ? 1.0 : 0.0,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    'HatColor',
                                    style: avatarCategorie.copyWith(
                                        color: Colors.white),
                                  ),
                                )),
                            color: Colors.transparent,
                          ),
                          Material(
                            color: Colors.transparent,
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 400),
                              opacity: _white ? 1.0 : 0.0,
                                                          child: Slider(
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedSliderOne = newValue;
                                  });
                                },
                                value: _selectedSliderOne,
                                max: 100,
                                min: 0,
                                divisions: 4,
                                activeColor: Colors.brown,
                                inactiveColor: Colors.white,
                              ),
                            ),
                          ),
                        Material(
                            child: AnimatedOpacity(
                                duration: Duration(milliseconds: 400),
                                opacity: _white ? 1.0 : 0.0,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    'Clothes',
                                    style: avatarCategorie.copyWith(
                                        color: Colors.white),
                                  ),
                                )),
                            color: Colors.transparent,
                          ),
                          Material(
                            color: Colors.transparent,
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 400),
                              opacity: _white ? 1.0 : 0.0,
                                                          child: Slider(
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedSliderOne = newValue;
                                  });
                                },
                                value: _selectedSliderOne,
                                max: 100,
                                min: 0,
                                divisions: 4,
                                activeColor: Colors.yellow,
                                inactiveColor: Colors.white,
                              ),
                            ),
                          ),
                        
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:avataaar_image/avataaar_image.dart';
import 'package:flutter/material.dart';
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

  List<Top> miTop = [
    Top.eyepatch(),
    Top.hat(),
    Top.hijab(),
    Top.longHairBigHair(),
    Top.longHairBob(),
    Top.longHairBun(),
    Top.longHairCurly(),
    Top.longHairCurvy(),
    Top.longHairDreads(),
    Top.longHairFrida(),
    Top.longHairFro(),
    Top.longHairFroBand(),
    Top.longHairMiaWallace(),
    Top.longHairNotTooLong(),
    Top.longHairShavedSides(),
    Top.longHairStraight(),
    Top.longHairStraight2(),
    Top.longHairStraightStrand(),
    Top.noHair(),
    Top.shortHairDreads01(),
    Top.shortHairDreads02(),
    Top.shortHairFrizzle(),
    Top.shortHairShaggyMullet(),
    Top.shortHairShortCurly(),
    Top.shortHairShortFlat(),
    Top.shortHairShortRound(),
    Top.shortHairShortWaved(),
    Top.shortHairSides(),
    Top.shortHairTheCaesar(),
    Top.shortHairTheCaesarSidePart(),
    Top.turban(),
    Top.winterHat1(),
    Top.winterHat2(),
    Top.winterHat3(),
    Top.winterHat4(),
  ];


  List<String> miList = [
    Top.eyepatch().pieces?.first.toString(),
    Top.hat().pieces?.first.toString().toString(),
    Top.hijab().pieces?.first.toString(),
    Top.longHairBigHair().pieces?.first.toString(),
    Top.longHairBob().pieces?.first.toString(),
    Top.longHairBun().pieces?.first.toString(),
    Top.longHairCurly().pieces?.first.toString(),
    Top.longHairCurvy().pieces?.first.toString(),
    Top.longHairDreads().pieces?.first.toString(),
    Top.longHairFrida().pieces?.first.toString(),
    Top.longHairFro().pieces?.first.toString(),
    Top.longHairFroBand().pieces?.first.toString(),
    Top.longHairMiaWallace().pieces?.first.toString(),
    Top.longHairNotTooLong().pieces?.first.toString(),
    Top.longHairShavedSides().pieces?.first.toString(),
    Top.longHairStraight().pieces?.first.toString(),
    Top.longHairStraight2().pieces?.first.toString(),
    Top.longHairStraightStrand().pieces?.first.toString(),
    Top.noHair().pieces?.first.toString(),
    Top.shortHairDreads01().pieces?.first.toString(),
    Top.shortHairDreads02().pieces?.first.toString(),
    Top.shortHairFrizzle().pieces?.first.toString(),
    Top.shortHairShaggyMullet().pieces?.first.toString(),
    Top.shortHairShortCurly().pieces?.first.toString(),
    Top.shortHairShortFlat().pieces?.first.toString(),
    Top.shortHairShortRound().pieces?.first.toString(),
    Top.shortHairShortWaved().pieces?.first.toString(),
    Top.shortHairSides().pieces?.first.toString(),
    Top.shortHairTheCaesar().pieces?.first.toString(),
    Top.shortHairTheCaesarSidePart().pieces?.first.toString(),
    Top.turban().pieces?.first.toString(),
    Top.winterHat1().pieces?.first.toString(),
    Top.winterHat2().pieces?.first.toString(),
    Top.winterHat3().pieces?.first.toString(),
    Top.winterHat4().pieces?.first.toString(),
  ];

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _white = true;
        _selectedSliderOne = valueIndex().toDouble();
      });
    });
  }

  void _randomizeAvatar() =>
      widget.user.avatar = Avataaar.random(style: Style.transparent);

  int valueIndex() {
    for (var i = 0; i < miList.length; i++) {
     if(widget.user.avatar.top.pieces.first != null)
     {
       print(widget.user.avatar.top.pieces);
       if(widget.user.avatar.top.pieces.first.toString().compareTo(miList[i]) == 0)
       {
         /*TODO: if pieces[1] != null, Asignar AccesoriesType*/
         print(widget.user.avatar.top.pieces.first.toString());
         print(miList[i]);
         return i;
       }
     }
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 40.0),
                  child: Container(
                    width: width * 0.8,
                    height: height * 0.4,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        color: Colors.white,
                        width: width * 0.4,
                        height: height * 0.25,
                        child: Hero(
                          tag: 'usuario',
                          child: Container(
                            child: AvataaarImage(
                                avatar: widget.user.avatar,
                                errorImage: Icon(Icons.error),
                                placeholder: CircularProgressIndicator(),
                                width: 400),
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
                                    widget.user.avatar = widget.user.avatar.copyWith(
                                      top: miTop[_selectedSliderOne.toInt()]
                                    );
                                  });
                                },
                                label:
                                    miList[_selectedSliderOne.toInt()].replaceAll(RegExp('TopType.'), ''),
                                value: _selectedSliderOne,
                                max: miList.length.toDouble()-1,
                                min: 0,
                                divisions: miList.length,
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
          FloatingActionButton(
            child: Icon(Icons.shuffle),
            onPressed: () {
              setState(() {
               _randomizeAvatar();
               _selectedSliderOne = valueIndex().toDouble();
              });
              
            },
          )
        ],
      ),
    );
  }
}

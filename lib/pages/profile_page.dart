import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodabs/models/classes/user.dart';
import 'package:foodabs/pages/avatar_intro_page.dart';
import 'package:foodabs/shapes/app_bar_profile_custom_painter.dart';
import 'package:foodabs/styles/text_styles.dart';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:polygon_clipper/polygon_clipper.dart';

import 'package:avataaar_image/avataaar_image.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  const ProfilePage({Key key, this.user}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
    _randomizeAvatar();
  }
  void _randomizeAvatar() =>  widget.user.avatar = Avataaar.random(
    style: Style.transparent
  );

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
                height: double.infinity,
                width: double.infinity,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        color: Colors.transparent),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: width * 0.4,
                          height: height * 0.25,
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                        pageBuilder: (BuildContext context,
                                                Animation<double> animation,
                                                Animation<double>
                                                    secondaryAnimation) =>
                                            AvatarIntroPage(
                                              user: widget.user,
                                            ),
                                        transitionsBuilder: (
                                          BuildContext context,
                                          Animation<double> animation,
                                          Animation<double> secondaryAnimation,
                                          Widget child,
                                        ) =>
                                            FadeTransition(
                                              opacity: animation,
                                              child: child,
                                            )));
                              },
                              child: Hero(
                                tag: 'usuario',
                                child: Container(
                                  child: AvataaarImage(
                                    avatar: widget.user.avatar,
                                    errorImage: Icon(Icons.error),
                                    placeholder: CircularProgressIndicator(),
                                    width: 280
                                  ),
                                )
                              )),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '1.76cm',
                                      style: itemHeight,
                                    ),
                                    Text(
                                      'Altura',
                                      style: hintHeight,
                                    )
                                  ],
                                ),
                                Container(
                                    child: Text(
                                  'Bruno',
                                  style: nameTitleProfile,
                                )),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '76kg',
                                      style: itemHeight,
                                    ),
                                    Text(
                                      'Peso',
                                      style: hintHeight,
                                    )
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Icon(
                            FontAwesomeIcons.male,
                            size: 40,
                            color: Colors.blueGrey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            child: TabBar(
                              controller: _tabController,
                              tabs: <Widget>[
                                Text(
                                  'Badges',
                                  style: itemTabBar,
                                ),
                                Text(
                                  'History',
                                  style: itemTabBar,
                                ),
                                Text(
                                  'Stats',
                                  style: itemTabBar,
                                )
                              ],
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: new BubbleTabIndicator(
                                indicatorHeight: 25.0,
                                indicatorColor: _currentIndex == 0
                                    ? Colors.greenAccent
                                    : _currentIndex == 1
                                        ? Colors.blueAccent
                                        : Colors.orange,
                                tabBarIndicatorSize: TabBarIndicatorSize.tab,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: <Widget>[
                              Center(
                                child: Swiper(
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(28.0),
                                      child: Center(
                                        child: ClipPolygon(
                                          sides: 6,
                                          borderRadius:
                                              5.0, // Default 0.0 degrees
                                          rotate: 90.0, // Default 0.0 degrees
                                          boxShadows: [
                                            PolygonBoxShadow(
                                                color: Colors.black,
                                                elevation: 1.0),
                                            PolygonBoxShadow(
                                                color: Colors.grey,
                                                elevation: 5.0)
                                          ],
                                          child: Container(
                                              color: index % 2 == 0
                                                  ? Colors.brown
                                                  : Colors.orangeAccent),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: 10,
                                  itemWidth: 300.0,
                                  layout: SwiperLayout.STACK,
                                ),
                              ),
                              Icon(Icons.add),
                              Icon(Icons.add)
                            ],
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: (){
                            setState(_randomizeAvatar);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

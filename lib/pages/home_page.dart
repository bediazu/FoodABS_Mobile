import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:foodabs/colors/global_colors.dart';

import 'package:foodabs/models/classes/user.dart';
import 'package:foodabs/pages/profile_page.dart';
import 'package:foodabs/widgets/camera/camera_viewport.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({Key key, this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page=1;
  PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: _page);

    /// ESTO FUE REMPLAZADO DENTRO
    /// DE "PAGE VIEW" (LÍNEA 48)
    /*
    _pageController.addListener(() {
      setState(() {
        _page = _pageController.page.toInt();
      });
    });
    */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: homeBackgroundColor,
        child: PageView(
          onPageChanged: (index) {
            setState(() {
              _page = index;
            });
          },
          controller: _pageController,
          children: <Widget>[
            CameraViewPort(),
            Icon(Icons.list),
            Icon(Icons.add),
            ProfilePage(user: widget.user),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        animationDuration: Duration(milliseconds: 500),
        backgroundColor: homeBackgroundColor,
        color: Colors.red,
        items: <Widget>[
          Icon(
            Icons.camera_alt,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.list,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.account_circle,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          print(index);

          setState(() {
            _page = index;
          });

          _pageController.animateToPage(_page,
              curve: Curves.decelerate, duration: Duration(milliseconds: 500));
        },
      ),
    );
  }
}

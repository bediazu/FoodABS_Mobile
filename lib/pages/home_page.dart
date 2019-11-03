import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:foodabs/colors/global_colors.dart';

import 'package:foodabs/models/classes/user.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({Key key, this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    _pageController.addListener(() {
      setState(() {
        _page = _pageController.page.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: homeBackgroundColor,
        child: PageView(
          controller: _pageController,
          children: <Widget>[
            Icon(Icons.list),
            Icon(Icons.add),
            Icon(Icons.clear),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        animationDuration: Duration(milliseconds: 500),
        backgroundColor: Colors.white,
        color: Colors.red,
        items: <Widget>[
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

import 'package:flutter/material.dart';
import 'package:foodabs/styles/text_styles.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => new Size.fromHeight(190);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Expanded(
          child: Stack(
            children: <Widget>[
              AppBar(
                backgroundColor: Colors.red,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 55.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Learn to design and code apps',
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
            ],
          ),
        ),
      ],
    );
  }
}

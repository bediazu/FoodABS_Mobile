import 'package:flutter/material.dart';
import 'package:foodabs/colors/global_colors.dart';

class AnimatedPicture extends StatefulWidget {
  
  final double offsetImage;
  final double offsetImageTop;

   AnimatedPicture({Key key, this.offsetImage, this.offsetImageTop}) : super(key: key);

  @override
  _AnimatedPictureState createState() => _AnimatedPictureState();
}

class _AnimatedPictureState extends State<AnimatedPicture> {


  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 1000),
      curve: Curves.decelerate,
      height: 170 + widget.offsetImage,
      width: 170 + widget.offsetImage,
      right: 30 + widget.offsetImage - 20,
      top: 10 + widget.offsetImageTop,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
            loginBackgroundColor.withOpacity(0.4), BlendMode.dstATop),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/login.png"))),
        ),
      ),
    );
  }
}

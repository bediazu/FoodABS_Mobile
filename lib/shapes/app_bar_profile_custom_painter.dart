import 'package:flutter/material.dart';

Color colorOne = Colors.red;
Color colorTwo = Colors.red[300];
Color colorThree = Colors.red[100];

class AppBarCurvePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
  Path path = Path();
  Paint paint = Paint();

  double _sizeHeight = size.height * 0.35;

  path.lineTo(0, _sizeHeight * 0.75);
  path.quadraticBezierTo(size.width* 0.10, _sizeHeight*0.70,   size.width*0.17, _sizeHeight*0.90);
  path.quadraticBezierTo(size.width*0.20, _sizeHeight, size.width*0.25, _sizeHeight*0.90);
  path.quadraticBezierTo(size.width*0.40, _sizeHeight*0.40, size.width*0.50, _sizeHeight*0.70);
  path.quadraticBezierTo(size.width*0.60, _sizeHeight*0.85, size.width*0.65, _sizeHeight*0.65);
  path.quadraticBezierTo(size.width*0.70, _sizeHeight*0.90, size.width, 0);
  path.close();

  paint.color = colorThree;
  canvas.drawPath(path, paint);

  path = Path();
  path.lineTo(0, _sizeHeight*0.50);
  path.quadraticBezierTo(size.width*0.10, _sizeHeight*0.80, size.width*0.15, _sizeHeight*0.60);
  path.quadraticBezierTo(size.width*0.20, _sizeHeight*0.45, size.width*0.27, _sizeHeight*0.60);
  path.quadraticBezierTo(size.width*0.45, _sizeHeight, size.width*0.50, _sizeHeight*0.80);
  path.quadraticBezierTo(size.width*0.55, _sizeHeight*0.45, size.width*0.75, _sizeHeight*0.75);
  path.quadraticBezierTo(size.width*0.85, _sizeHeight*0.93, size.width, _sizeHeight*0.60);
  path.lineTo(size.width, 0);
  path.close();

  paint.color = colorTwo;
  canvas.drawPath(path, paint);

  path =Path();
  path.lineTo(0, _sizeHeight*0.75);
  path.quadraticBezierTo(size.width*0.10, _sizeHeight*0.55, size.width*0.22, _sizeHeight*0.70);
  path.quadraticBezierTo(size.width*0.30, _sizeHeight*0.90, size.width*0.40, _sizeHeight*0.75);
  path.quadraticBezierTo(size.width*0.52, _sizeHeight*0.50, size.width*0.65, _sizeHeight*0.70);
  path.quadraticBezierTo(size.width*0.75, _sizeHeight*0.85, size.width, _sizeHeight*0.60);
  path.lineTo(size.width, 0);
  path.close();

  paint.color = colorOne;
  canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

}
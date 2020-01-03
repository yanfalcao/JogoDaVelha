
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:jogo_da_velha/color/ColorsApp.dart';

class ShapePlay extends CustomPainter {
  double _fraction;

  ShapePlay(this._fraction);

  @override
  void paint(Canvas canvas, Size size) {
    //Player One
    playerOne(canvas, size);
    //Player Two
    playerTwo(canvas, size);
    //LineOneVertical
    canvas.drawLine(
        Offset(size.width*0.34, size.height*0.25),
        Offset(size.width*0.34, size.height*0.75),
        _paintLine());
    //LineTwoVertical
    canvas.drawLine(
        Offset(size.width*0.655, size.height*0.25),
        Offset(size.width*0.655, size.height*0.75),
        _paintLine());
    //LineOneHorizontal
    canvas.drawLine(
        Offset(size.width*0.1, size.height*0.404),
        Offset(size.width*0.9, size.height*0.404),
        _paintLine());
    //LineTwoHorizontal
    canvas.drawLine(
        Offset(size.width*0.1, size.height*0.59),
        Offset(size.width*0.9, size.height*0.59),
        _paintLine());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void playerOne(Canvas canvas, Size size){
    canvas.drawPath(
        Path()
        ..moveTo(0, size.height * 0.05 * _fraction)
        ..quadraticBezierTo(
            size.width/2,
            size.height/5 * _fraction,
            size.width,
            size.height*0.05 * _fraction)
        ..lineTo(size.width, 0)
        ..lineTo(0, 0)
        ..close(),
        _paintPlayerShape());
  }

  void playerTwo(Canvas canvas, Size size){
    canvas.drawPath(
        Path()
        ..moveTo(0, size.height - size.height*0.05 * _fraction)
        ..quadraticBezierTo(
            size.width/2,
            size.height - size.height*0.2 * _fraction,
            size.width,
            size.height - size.height*0.05 * _fraction)
        ..lineTo(size.width, size.height)
        ..lineTo(0, size.height)
        ..close(),
        _paintPlayerShape());
  }

  Paint _paintLine(){
    return Paint()
      ..color = ColorLine()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.5;
  }

  Paint _paintPlayerShape(){
    return Paint()
        ..color = ColorPlayerShape()
        ..style = PaintingStyle.fill;
  }
}
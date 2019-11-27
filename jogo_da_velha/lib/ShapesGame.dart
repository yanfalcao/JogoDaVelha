
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    lineOneVertical(canvas, size);
    //LineTwoVertical
    lineTwoVertical(canvas, size);
    //LineOneHorizontal
    lineOneHorizontal(canvas, size);
    //LineTwoHorizontal
    lineTwoHorizontal(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void playerOne(Canvas canvas, Size size){
    var paint = Paint();
    paint.color = new Color.fromRGBO(71, 219, 251, 100);
    paint.style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(
        0,
        size.height * 0.05 * _fraction);
    path.quadraticBezierTo(
        size.width/2,
        size.height/5 * _fraction,
        size.width,
        size.height*0.05 * _fraction);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  void playerTwo(Canvas canvas, Size size){
    var paint = Paint();
    paint.color = new Color.fromRGBO(71, 219, 251, 100);
    paint.style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(
        0,
        size.height * 0.95 / _fraction);
    path.quadraticBezierTo(
        size.width/2,
        size.height*0.8 / _fraction,
        size.width,
        size.height * 0.95 / _fraction);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  void lineOneVertical(Canvas canvas, Size size){
    canvas.drawLine(
        Offset(size.width*0.34, size.height*0.25),
        Offset(size.width*0.34,
            size.height*0.75),
        _paintLine());
  }

  void lineTwoVertical(Canvas canvas, Size size){
    canvas.drawLine(
        Offset(size.width*0.655, size.height*0.25),
        Offset(size.width*0.655,
            size.height*0.75),
        _paintLine());
  }

  void lineOneHorizontal(Canvas canvas, Size size){
    canvas.drawLine(
        Offset(size.width*0.1, size.height*0.404),
        Offset(size.width*0.9,
            size.height*0.404),
        _paintLine());
  }

  void lineTwoHorizontal(Canvas canvas, Size size){
    canvas.drawLine(
        Offset(size.width*0.1, size.height*0.59),
        Offset(size.width*0.9,
            size.height*0.59),
        _paintLine());
  }

  Paint _paintLine(){
    return Paint()
      ..color = Color.fromRGBO(30, 39, 46, 100)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.5;
  }
}



class ShapePlayerOne extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = new Color.fromRGBO(71, 219, 251, 100);
    paint.style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, size.height * 0.05);
    path.quadraticBezierTo(size.width/2, size.height/5,
        size.width, size.height*0.05);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

class ShapePlayerTwo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = new Color.fromRGBO(71, 219, 251, 100);
    paint.style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, size.height * 0.95);
    path.quadraticBezierTo(size.width/2, size.height*0.8,
        size.width, size.height*0.95);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}
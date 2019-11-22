
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RandomColor.dart';


class ShapePlay extends CustomPainter {
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
    path.moveTo(0, size.height * 0.05);
    path.quadraticBezierTo(size.width/2, size.height/5,
        size.width, size.height*0.05);
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
    path.moveTo(0, size.height * 0.95);
    path.quadraticBezierTo(size.width/2, size.height*0.8,
        size.width, size.height*0.95);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  void lineOneVertical(Canvas canvas, Size size){
    var paint = Paint();
    paint.color = Color.fromRGBO(30, 39, 46, 100);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5.0;

    var path = Path();
    path.moveTo(size.width*0.33, size.height*0.25);
    path.lineTo(size.width*0.33, size.height*0.75);
    path.close();

    canvas.drawPath(path, paint);
  }

  void lineTwoVertical(Canvas canvas, Size size){
    var paint = Paint();
    paint.color = paint.color = Color.fromRGBO(30, 39, 46, 100);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5.0;

    var path = Path();
    path.moveTo(size.width*0.66, size.height*0.25);
    path.lineTo(size.width*0.66, size.height*0.75);
    path.close();

    canvas.drawPath(path, paint);
  }

  void lineOneHorizontal(Canvas canvas, Size size){
    var paint = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5.0;

    var path = Path();
    path.moveTo(size.width*0.1, size.height*0.4);
    path.lineTo(size.width*0.9, size.height*0.4);
    path.close();

    canvas.drawPath(path, paint);
  }

  void lineTwoHorizontal(Canvas canvas, Size size){
    var paint = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5.0;

    var path = Path();
    path.moveTo(size.width*0.1, size.height*0.59);
    path.lineTo(size.width*0.9, size.height*0.59);
    path.close();

    canvas.drawPath(path, paint);
  }
}

class XO {
  Widget O1_1(){
    return Align(
      alignment: Alignment(-0.69, -0.38),
      child: _OIcon(),
    );
  }

  Widget X1_1(){
    return Align(
      alignment: Alignment(-0.72, -0.38),
      child: _XIcon(),
    );
  }

  Widget O2_1(){
    return Align(
      alignment: Alignment(0, -0.38),
      child: _OIcon(),
    );
  }

  Widget X2_1(){
    return Align(
        alignment: Alignment(0, -0.38),
        child: _XIcon(),
    );
  }

  Widget O3_1(){
    return Align(
      alignment: Alignment(0.69, -0.38),
      child: _OIcon(),
    );
  }

  Widget X3_1(){
    return Align(
        alignment: Alignment(0.72, -0.38),
        child: _XIcon(),
    );
  }

  Widget O1_2(){
    return Align(
      alignment: Alignment(-0.69, 0),
      child: _OIcon(),
    );
  }

  Widget X1_2(){
    return Align(
      alignment: Alignment(-0.72, 0),
      child: _XIcon(),
    );
  }

  Widget O2_2(){
    return Align(
      alignment: Alignment(0, 0),
      child: _OIcon(),
    );
  }

  Widget X2_2(){
    return Align(
      alignment: Alignment(0, 0),
      child: _XIcon(),
    );
  }

  Widget O3_2(){
    return Align(
      alignment: Alignment(0.69,0),
      child: _OIcon(),
    );
  }

  Widget X3_2(){
    return Align(
      alignment: Alignment(0.72, 0),
      child: _XIcon(),
    );
  }

  Widget O1_3(){
    return Align(
      alignment: Alignment(-0.69, 0.38),
      child: _OIcon(),
    );
  }

  Widget X1_3(){
    return Align(
      alignment: Alignment(-0.72, 0.38),
      child: _XIcon(),
    );
  }

  Widget O2_3(){
    return Align(
      alignment: Alignment(0, 0.38),
      child: _OIcon(),
    );
  }

  Widget X2_3(){
    return Align(
      alignment: Alignment(0, 0.38),
      child: _XIcon(),
    );
  }

  Widget O3_3(){
    return Align(
      alignment: Alignment(0.69, 0.38),
      child: _OIcon(),
    );
  }

  Widget X3_3(){
    return Align(
      alignment: Alignment(0.72, 0.38),
      child: _XIcon(),
    );
  }

  Widget _XIcon(){
    return Icon(
      Icons.close,
      color:  new RandomColor().getColor(),
      size: 120,
    );
  }

  Widget _OIcon(){
    return Icon(
      Icons.panorama_fish_eye,
      color:  new RandomColor().getColor(),
      size: 100,
    );
  }
}
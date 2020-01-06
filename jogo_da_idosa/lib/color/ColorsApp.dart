import 'dart:math';

import 'package:flutter/material.dart';

Color RandomColor(){
  List<Color> colors = new List<Color>();

  colors.add(Color.fromRGBO(0, 184, 148, 100));
  colors.add(Color.fromRGBO(7, 153, 146, 100));
  colors.add(Color.fromRGBO(10, 61, 98, 100));
  colors.add(Color.fromRGBO(22, 160, 133, 100));
  colors.add(Color.fromRGBO(30, 55, 153, 100));
  colors.add(Color.fromRGBO(39, 174, 96, 100));
  colors.add(Color.fromRGBO(41, 128, 185, 100));
  colors.add(Color.fromRGBO(60, 64, 198, 100));
  colors.add(Color.fromRGBO(61, 193, 211, 100));
  colors.add(Color.fromRGBO(108, 92, 231, 100));
  colors.add(Color.fromRGBO(162, 155, 254, 100));
  colors.add(Color.fromRGBO(183, 21, 64, 100));
  colors.add(Color.fromRGBO(192, 57, 43, 100));
  colors.add(Color.fromRGBO(211, 84, 0, 100));
  colors.add(Color.fromRGBO(225, 112, 85, 100));
  colors.add(Color.fromRGBO(229, 80, 57, 100));
  colors.add(Color.fromRGBO(230, 103, 103, 100));
  colors.add(Color.fromRGBO(232, 67, 147, 100));
  colors.add(Color.fromRGBO(235, 47, 6, 100));
  colors.add(Color.fromRGBO(245, 205, 121, 100));
  colors.add(Color.fromRGBO(255, 63, 52, 100));

  //return Color.fromRGBO(new Random().nextInt(256), new Random().nextInt(256), new Random().nextInt(256), 100);
  return colors.elementAt(new Random().nextInt(21));
}

Color EditTransparent(double visibility){
  return new Color.fromRGBO(71, 219, 251, visibility);
}

Color Transparent(){
  return new Color.fromRGBO(71, 219, 251, 0);
}

Color ColorLine(){
  return new Color.fromRGBO(30, 39, 46, 100);
}

Color ColorPlayerShape(){
  return new Color.fromRGBO(71, 219, 251, 100);
}
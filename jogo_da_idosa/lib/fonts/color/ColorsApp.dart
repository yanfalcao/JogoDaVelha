import 'dart:math';

import 'package:flutter/material.dart';

Color RandomColor(){
  return Color.fromRGBO(new Random().nextInt(250), new Random().nextInt(250), new Random().nextInt(250), 100);
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
  return new Color.fromRGBO(70, 220, 250, 100);
}

Color ColorGold(){
  return new Color.fromRGBO(253, 191, 0, 20);
}
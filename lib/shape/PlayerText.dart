import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:jogo_da_idosa/fonts/color/ColorsApp.dart';

Widget PlayerTwoText(bool playerTurn){
  return Align(
    alignment: Alignment(0, -0.97),
    child: Transform.rotate(
      angle: - 3.1415927,
      child: Text(
        'Player 2',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: playerTurn ? Transparent():Colors.white,
          fontSize: 55, // 65
        ),
      ),
    ),
  );
}

Widget PlayerOneText(bool playerTurn, double _fraction){
  return Align(
    alignment: Alignment(0, 0.97),
    child: Text(
      'Player 1',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: playerTurn && _fraction == 1 ? Colors.white:Transparent(),
        fontSize: 55, // 65
      ),
    ),
  );
}
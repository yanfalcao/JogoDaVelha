import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:jogo_da_idosa/fonts/color/ColorsApp.dart';
import 'package:jogo_da_idosa/fonts/icons/custom_icon_icons.dart';

Widget PlayerTwoText(bool playerTurn){
  return Stack(
    children: <Widget>[
      Align(
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
      ),
      Align(
        alignment: Alignment(0, -0.85),
        child: Transform.rotate(
          angle: - 3.1415927,
          child: Icon(
            CustomIcon.crowns,
            color: playerTurn ? Transparent():ColorGold(),
            size: 85,
          ),
        ),
      )
    ],
  );
}

Widget PlayerOneText(bool playerTurn, double _fraction){
  return Stack(
    children: <Widget>[
      Align(
       alignment: Alignment(0, 0.85),
       child: Icon(
         CustomIcon.crowns,
         color: playerTurn && _fraction == 1 ? ColorGold():Transparent(),
         size: 85,
       ),
      ),
      Align(
        alignment: Alignment(0, 0.97),
        child: Text(
          'Player 1',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: playerTurn && _fraction == 1 ? Colors.white:Transparent(),
            fontSize: 55, // 65
          ),
        ),
      )
    ],
  );
}
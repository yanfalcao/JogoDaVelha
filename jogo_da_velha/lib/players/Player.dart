import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../RandomColor.dart';

class PlayerTwoText {
  Widget paint(bool playerTurn){
    return Align(
      alignment: Alignment(0, -0.97),
      child: Transform.rotate(
        angle: - 3.1415927,
        child: Text(
          'Player 2',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: playerTurn ? RandomColor().getTransparent():Colors.white,
            fontSize: 65,
          ),
        ),
      ),
    );
  }
}

class PlayerOneText {
  Widget paint(bool playerTurn, double _fraction){
    return Align(
      alignment: Alignment(0, 0.97),
      child: Text(
        'Player 1',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: playerTurn && _fraction == 1 ? Colors.white:RandomColor().getTransparent(),
          fontSize: 65,
        ),
      ),
    );
  }
}
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';

class FireworkAnimation {

  final FlareControls _controlsOne = FlareControls();
  final FlareControls _controlsTwo = FlareControls();

  Widget playerOne(){
    return FlareActor(
      'assets/StarEffect.flr',
      animation: "idle",
      alignment: Alignment.bottomCenter,
      controller: _controlsOne,
    );
  }

  Widget playerTwo(){
    return FlareActor(
      'assets/StarEffect.flr',
      animation: "idle",
      alignment: Alignment.topCenter,
      controller: _controlsTwo,
    );
  }

  void playfireworkPlayerOne(){
    _controlsOne.play("explode");
  }

  void playfireworkPlayerTwo(){
    _controlsTwo.play("explode");
  }
}
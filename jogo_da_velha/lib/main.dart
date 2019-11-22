import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ShapesGame.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.white,
        child: CustomPaint(
          painter: ShapePlay(),
          child: Players(),
        ),
      ),
    );
  }
}

class Players extends StatelessWidget {
  XO xo = new XO();

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: <Widget>[
          playerTwo(),
          playerOne(),
          xo.X1_1(),
          xo.O2_1(),
          xo.X3_1(),
          xo.O1_2(),
          xo.X2_2(),
          xo.O3_2(),
          xo.X1_3(),
          xo.O2_3(),
          xo.X3_3(),
        ],
      ),
    );
  }

  Widget playerTwo(){
    return Align(
      alignment: Alignment(0, -0.97),
      child: Transform.rotate(
        angle: - 3.1415927,
        child: Text(
          'Player 2',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 65,
          ),
        ),
      ),
    );
  }

  Widget playerOne(){
    return Align(
      alignment: Alignment(0, 0.97),
      child: Text(
        'Player 1',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 65,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'ShapesGame.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.white,
        child: CustomPaint(
          painter: ShapePlayer(),
          child: PlayerOneText(),
        ),
      ),
    );
  }
}

class PlayerTwoText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Align(
        alignment: Alignment(0, -0.95),
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
      ),
    );
  }
}

class PlayerOneText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Align(
        alignment: Alignment(0, 0.95),
        child: Text(
          'Player 1',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 65,
          ),
        ),
      ),
    );
  }
}

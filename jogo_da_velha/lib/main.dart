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
        ),
      ),
    );
  }
}

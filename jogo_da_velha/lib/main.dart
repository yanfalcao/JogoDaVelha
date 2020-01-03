import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jogo_da_velha/shape/PlayerText.dart';
import 'package:jogo_da_velha/color/ColorsApp.dart';
import 'package:jogo_da_velha/shape/ShapesGame.dart';
import 'Win.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: GameIteractive(),
    );
  }
}

class GameIteractiveState extends State<GameIteractive> with SingleTickerProviderStateMixin{
  bool playerTurn = true;
  String _statusGame = Winner.CONTINUE;
  Winner winner = Winner();

  List<List<int>> matrix = new List<List<int>>();
  List<List<Color>> matrixColor = new List<List<Color>>();

  Animation<double> animationOut;
  Animation<double> animationOpacity;
  Animation<double> animationSize;
  AnimationController controller;
  double _fraction;
  double _fractionOpacity;
  double _fractionSize;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 2300), vsync: this);

    animationOut = Tween(
        begin: 0.0,
        end: 1.0)
        .animate(controller)
      ..addListener(() {
        setState(() {
          if(_statusGame == Winner.CONTINUE)
            _fraction = animationOut.value;
        });
      });

    animationOpacity = Tween<double>(
        begin: 1.0,
        end: 0.0)
        .animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.4, curve: Curves.easeOut)))
      ..addListener(() {
        setState(() {
          _fractionOpacity = animationOpacity.value;
        });
      });

    animationSize = Tween<double>(
        begin: 100.0,
        end: 120.0)
        .animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.6, curve: Curves.elasticInOut)))
      ..addListener(() {
        setState(() {
          _fractionSize = animationSize.value;
        });
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    _initMatrix();
    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: Colors.white,
        child: CustomPaint(
          painter: ShapePlay(_fraction),
          child: Stack(
            children: <Widget>[
              PlayerTwoText(
                  playerTurn
              ),
              PlayerOneText(
                  playerTurn,
                  _fraction
              ),
              _XO(
                  Alignment(matrix[0][0] == 1 ? -0.72:-0.69, -0.38),
                  0,
                  0
              ),  // XO 1 1
              _XO(
                  Alignment(0, -0.38),
                  0,
                  1
              ), // XO 1 2
              _XO(
                  Alignment(matrix[0][2] == 1 ? 0.72:0.69, -0.38),
                  0,
                  2
              ), // XO 1 3
              _XO(
                  Alignment(matrix[1][0] == 1 ? -0.72:-0.69, 0),
                  1,
                  0
              ), // XO 2 1
              _XO(
                  Alignment(0, 0),
                  1,
                  1
              ), // XO 2 2
              _XO(
                  Alignment(matrix[1][2] == 1 ? 0.72:0.69, 0),
                  1,
                  2
              ),// XO 2 3
              _XO(
                  Alignment(matrix[2][0] == 1 ? -0.72:-0.69, 0.38),
                  2,
                  0
              ),// XO 3 1
              _XO(
                  Alignment(0, 0.38),
                  2,
                  1
              ),// XO 3 2
              _XO(
                  Alignment(matrix[2][2] == 1 ? 0.72:0.69, 0.38),
                  2,
                  2
              ),// XO 3 3
            ],
          ),
        ),
      ),
    );
  }

  void _toggleTurn(int x, int y) {
      if(playerTurn){
        if(matrix[x][y] == 0){
          matrix[x][y] = 1;
          matrixColor[x][y] = RandomColor();
          playerTurn = false;
        }
      }else{
        if(matrix[x][y] == 0){
          matrix[x][y] = 2;
          matrixColor[x][y] = RandomColor();
          playerTurn = true;
        }
      }
      _statusGame = winner.checkWinner(matrix);
      if(_statusGame != Winner.CONTINUE){
        controller.reset();
        controller.forward();
      }
  }

  void _initMatrix(){
    for (var i = 0; i < 3; i++) {
      matrix.add(new List<int>());
      matrixColor.add(new List<Color>());

      for (var j = 0; j < 3; j++) {
        matrix[i].add(0);
        matrixColor[i].add(Transparent());
      }
    }
  }

  Widget _XO(Alignment alignment, int x, int y){
    int state = matrix[x][y];
    double size = state == 1 ? 120:100;
    int position = int.parse(x.toString() + y.toString());

    if(StatusAnimationXO.getStatus(_statusGame, position) == StatusAnimationXO.OPACITY){
      if(matrixColor[x][y].value != Transparent().value)
        matrixColor[x][y] = EditTransparent(_fractionOpacity);
    }else if(StatusAnimationXO.getStatus(_statusGame, position) == StatusAnimationXO.SIZE_OUT){
      size = state == 1 ? _fractionSize + 20 : _fractionSize;
    }

    return Align(
      alignment: alignment,
      child: IconButton(
        icon: state == 1 ? Icon(Icons.close):Icon(Icons.panorama_fish_eye),
        color: matrixColor[x][y],
        iconSize: size,
        onPressed: (){
          setState(() {
            _toggleTurn(x, y);
          });
        },
      ),
    );
  }
}

class GameIteractive extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => GameIteractiveState();
}
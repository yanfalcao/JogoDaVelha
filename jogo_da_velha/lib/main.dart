import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jogo_da_velha/players/Player.dart';
import 'RandomColor.dart';
import 'ShapesGame.dart';
import 'Win.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: GameIteractive(),
    );
  }
}

class GameIteractiveState extends State<GameIteractive> with SingleTickerProviderStateMixin{
  RandomColor randColor = RandomColor();

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
              PlayerTwoText().paint(playerTurn),
              PlayerOneText().paint(playerTurn, _fraction),
              _XO1_1(matrix[0][0]),
              _XO1_2(matrix[0][1]),
              _XO1_3(matrix[0][2]),
              _XO2_1(matrix[1][0]),
              _XO2_2(matrix[1][1]),
              _XO2_3(matrix[1][2]),
              _XO3_1(matrix[2][0]),
              _XO3_2(matrix[2][1]),
              _XO3_3(matrix[2][2]),
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
          matrixColor[x][y] = randColor.getColor();
          playerTurn = false;
        }
      }else{
        if(matrix[x][y] == 0){
          matrix[x][y] = 2;
          matrixColor[x][y] = randColor.getColor();
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
        matrixColor[i].add(randColor.getTransparent());
      }
    }
  }

  Widget _XO1_1(int state){
    Icon icon = state == 1 ? Icon(Icons.close):Icon(Icons.panorama_fish_eye);
    double size = state == 1 ? 120:100;
    double x = state == 1 ? -0.72:-0.69;

    if(StatusAnimationXO.getStatus(_statusGame, 11) == StatusAnimationXO.OPACITY){
      if(matrixColor[0][0].value != randColor.getTransparent().value)
        matrixColor[0][0] = randColor.getEditTransparent(_fractionOpacity);
    }else if(StatusAnimationXO.getStatus(_statusGame, 11) == StatusAnimationXO.SIZE_OUT){
      size = state == 1 ? _fractionSize + 20 : _fractionSize;
    }

    return Align(
      alignment: Alignment(x, -0.38),
      child: IconButton(
        icon: icon,
        color: matrixColor[0][0],
        iconSize: size,
        onPressed: (){
          setState(() {
            _toggleTurn(0, 0);
          });
        },
      ),
    );
  }

  Widget _XO1_2(int state){
    Icon icon = state == 1 ? Icon(Icons.close):Icon(Icons.panorama_fish_eye);
    double size = state == 1 ? 120:100;

    if(StatusAnimationXO.getStatus(_statusGame, 12) == StatusAnimationXO.OPACITY){
      if(matrixColor[0][1].value != randColor.getTransparent().value)
        matrixColor[0][1] = randColor.getEditTransparent(_fractionOpacity);
    }else if(StatusAnimationXO.getStatus(_statusGame, 12) == StatusAnimationXO.SIZE_OUT){
      size = state == 1 ? _fractionSize + 20 : _fractionSize;
    }

    return Align(
      alignment: Alignment(0, -0.38),
      child: IconButton(
        icon: icon,
        color: matrixColor[0][1],
        iconSize: size,
        onPressed: (){
          setState(() {
            _toggleTurn(0, 1);
          });
        },
      ),
    );
  }

  Widget _XO1_3(int state){
    Icon icon = state == 1 ? Icon(Icons.close):Icon(Icons.panorama_fish_eye);
    double size = state == 1 ? 120:100;
    double x = state == 1 ? 0.72:0.69;

    if(StatusAnimationXO.getStatus(_statusGame, 13) == StatusAnimationXO.OPACITY){
      if(matrixColor[0][2].value != randColor.getTransparent().value)
        matrixColor[0][2] = randColor.getEditTransparent(_fractionOpacity);
    }else if(StatusAnimationXO.getStatus(_statusGame, 13) == StatusAnimationXO.SIZE_OUT){
      size = state == 1 ? _fractionSize + 20 : _fractionSize;
    }

    return Align(
      alignment: Alignment(x, -0.38),
      child: IconButton(
        icon: icon,
        color: matrixColor[0][2],
        iconSize: size,
        onPressed: (){
          setState(() {
            _toggleTurn(0, 2);
          });
        },
      ),
    );
  }

  Widget _XO2_1(int state){
    Icon icon = state == 1 ? Icon(Icons.close):Icon(Icons.panorama_fish_eye);
    double size = state == 1 ? 120:100;
    double x = state == 1 ? -0.72:-0.69;

    if(StatusAnimationXO.getStatus(_statusGame, 21) == StatusAnimationXO.OPACITY){
      if(matrixColor[1][0].value != randColor.getTransparent().value)
        matrixColor[1][0] = randColor.getEditTransparent(_fractionOpacity);
    }else if(StatusAnimationXO.getStatus(_statusGame, 21) == StatusAnimationXO.SIZE_OUT){
      size = state == 1 ? _fractionSize + 20 : _fractionSize;
    }

    return Align(
      alignment: Alignment(x, 0),
      child: IconButton(
        icon: icon,
        color: matrixColor[1][0],
        iconSize: size,
        onPressed: (){
          setState(() {
            _toggleTurn(1, 0);
          });
        },
      ),
    );
  }

  Widget _XO2_2(int state){
    Icon icon = state == 1 ? Icon(Icons.close):Icon(Icons.panorama_fish_eye);
    double size = state == 1 ? 120:100;

    if(StatusAnimationXO.getStatus(_statusGame, 22) == StatusAnimationXO.OPACITY){
      if(matrixColor[1][1].value != randColor.getTransparent().value)
        matrixColor[1][1] = randColor.getEditTransparent(_fractionOpacity);
    }else if(StatusAnimationXO.getStatus(_statusGame, 22) == StatusAnimationXO.SIZE_OUT){
      size = state == 1 ? _fractionSize + 20 : _fractionSize;
    }

    return Align(
      alignment: Alignment(0, 0),
      child: IconButton(
        icon: icon,
        color: matrixColor[1][1],
        iconSize: size,
        onPressed: (){
          setState(() {
            _toggleTurn(1, 1);
          });
        },
      ),
    );
  }

  Widget _XO2_3(int state){
    Icon icon = state == 1 ? Icon(Icons.close):Icon(Icons.panorama_fish_eye);
    double size = state == 1 ? 120:100;
    double x = state == 1 ? 0.72:0.69;

    if(StatusAnimationXO.getStatus(_statusGame, 23) == StatusAnimationXO.OPACITY){
      if(matrixColor[1][2].value != randColor.getTransparent().value)
        matrixColor[1][2] = randColor.getEditTransparent(_fractionOpacity);
    }else if(StatusAnimationXO.getStatus(_statusGame, 23) == StatusAnimationXO.SIZE_OUT){
      size = state == 1 ? _fractionSize + 20 : _fractionSize;
    }

    return Align(
      alignment: Alignment(x, 0),
      child: IconButton(
        icon: icon,
        color: matrixColor[1][2],
        iconSize: size,
        onPressed: (){
          setState(() {
            _toggleTurn(1, 2);
          });
        },
      ),
    );
  }

  Widget _XO3_1(int state){
    Icon icon = state == 1 ? Icon(Icons.close):Icon(Icons.panorama_fish_eye);
    double size = state == 1 ? 120:100;
    double x = state == 1 ? -0.72:-0.69;

    if(StatusAnimationXO.getStatus(_statusGame, 31) == StatusAnimationXO.OPACITY){
      if(matrixColor[2][0].value != randColor.getTransparent().value)
        matrixColor[2][0] = randColor.getEditTransparent(_fractionOpacity);
    }else if(StatusAnimationXO.getStatus(_statusGame, 31) == StatusAnimationXO.SIZE_OUT){
      size = state == 1 ? _fractionSize + 20 : _fractionSize;
    }

    return Align(
      alignment: Alignment(x, 0.38),
      child: IconButton(
        icon: icon,
        color: matrixColor[2][0],
        iconSize: size,
        onPressed: (){
          setState(() {
            _toggleTurn(2, 0);
          });
        },
      ),
    );
  }

  Widget _XO3_2(int state){
    Icon icon = state == 1 ? Icon(Icons.close):Icon(Icons.panorama_fish_eye);
    double size = state == 1 ? 120:100;

    if(StatusAnimationXO.getStatus(_statusGame, 32) == StatusAnimationXO.OPACITY){
      if(matrixColor[2][1].value != randColor.getTransparent().value)
        matrixColor[2][1] = randColor.getEditTransparent(_fractionOpacity);
    }else if(StatusAnimationXO.getStatus(_statusGame, 32) == StatusAnimationXO.SIZE_OUT){
      size = state == 1 ? _fractionSize + 20 : _fractionSize;
    }

    return Align(
      alignment: Alignment(0, 0.38),
      child: IconButton(
        icon: icon,
        color: matrixColor[2][1],
        iconSize: size,
        onPressed: (){
          setState(() {
            _toggleTurn(2, 1);
          });
        },
      ),
    );
  }

  Widget _XO3_3(int state){
    Icon icon = state == 1 ? Icon(Icons.close):Icon(Icons.panorama_fish_eye);
    double size = state == 1 ? 120:100;
    double x = state == 1 ? 0.72:0.69;

    if(StatusAnimationXO.getStatus(_statusGame, 33) == StatusAnimationXO.OPACITY){
      if(matrixColor[2][2].value != randColor.getTransparent().value)
        matrixColor[2][2] = randColor.getEditTransparent(_fractionOpacity);
    }else if(StatusAnimationXO.getStatus(_statusGame, 33) == StatusAnimationXO.SIZE_OUT){
      size = state == 1 ? _fractionSize + 20 : _fractionSize;
    }

    return Align(
      alignment: Alignment(x, 0.38),
      child: IconButton(
        icon: icon,
        color:  matrixColor[2][2],
        iconSize: size,
        onPressed: (){
          setState(() {
            _toggleTurn(2, 2);
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
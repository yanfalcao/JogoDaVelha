import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jogo_da_idosa/shape/PlayerText.dart';
import 'package:jogo_da_idosa/fonts/color/ColorsApp.dart';
import 'package:jogo_da_idosa/shape/ShapesGame.dart';
import 'Win.dart';
import 'controller/MatrixState.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([
      SystemUiOverlay.bottom,
    ]);
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
  bool stop = false;
  bool playerTurn = true;
  String _statusGame = Winner.CONTINUE;
  Winner winner = Winner();

  MatrixState state = MatrixState();

  Animation<double> animationOut;
  Animation<double> animationOpacity;
  AnimationController controller;
  double _fraction;
  double _fractionOpacity;

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
        curve: Interval(0.0, 0.5, curve: Curves.easeOut)))
      ..addListener(() {
        setState(() {
          _fractionOpacity = animationOpacity.value;
        });
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomPaint(
        painter: ShapePlay(_fraction),
        child: Stack(
          children: <Widget>[
            PlayerTwoText(playerTurn),
            PlayerOneText(playerTurn, _fraction),
            _XO(Alignment(_xPosition(0, 0), -0.41), 0, 0),  // XO 1 1
            _XO(Alignment(0, -0.41), 0, 1),                 // XO 1 2
            _XO(Alignment(_xPosition(0, 2), -0.41), 0, 2),  // XO 1 3
            _XO(Alignment(_xPosition(1, 0), 0), 1, 0),      // XO 2 1
            _XO(Alignment(0, 0), 1, 1),                     // XO 2 2
            _XO(Alignment(_xPosition(1, 2), 0), 1, 2),      // XO 2 3
            _XO(Alignment(_xPosition(2, 0), 0.41), 2, 0),   // XO 3 1
            _XO(Alignment(0, 0.41), 2, 1),                  // XO 3 2
            _XO(Alignment(_xPosition(2, 2), 0.41), 2, 2),   // XO 3 3
          ],
        ),
      ),
    );
  }

  void _toggleTurn(int x, int y) {
    if(!stop){
      if(playerTurn){
        if(state.getState(x, y) == 0){
          state.setState(x, y, 1);
          state.setColor(x, y, RandomColor());
          playerTurn = false;
        }
      }else{
        if(state.getState(x, y) == 0){
          state.setState(x, y, 2);
          state.setColor(x, y, RandomColor());
          playerTurn = true;
        }
      }
      _statusGame = winner.checkWinner(state);
      if(_statusGame != Winner.CONTINUE){
        controller.reset();
        controller.forward();
      }
    }
    if(_statusGame != Winner.CONTINUE && _statusGame != Winner.NOBODY){
      if(!stop)
        playerTurn = playerTurn ? false : true;

      stop = true;
    }
  }

  double _xPosition(int x, int y){
    if(x == 0 && y == 0)
      return state.getState(x, y) == 1 ? -0.78:-0.73;
    if(x == 0 && y == 2)
      return state.getState(x, y) == 1 ? 0.78:0.73;
    if(x == 1 && y == 0)
      return state.getState(x, y) == 1 ? -0.78:-0.73;
    if(x == 1 && y == 2)
      return state.getState(x, y) == 1 ? 0.78:0.73;
    if(x == 2 && y == 0)
      return state.getState(x, y) == 1 ? -0.78:-0.73;
    else
      return state.getState(x, y) == 1 ? 00.78:0.73;
  }

  Widget _XO(Alignment alignment, int x, int y){
    int position = int.parse(x.toString() + y.toString());

    if(StatusAnimationXO.getStatus(_statusGame, position) == StatusAnimationXO.OPACITY){
      if(state.getColor(x, y).value != Transparent().value)
        state.setColor(x, y, EditTransparent(_fractionOpacity));
    }

    return Align(
      alignment: alignment,
      child: IconButton(
        icon: state.getState(x, y) == 1 ? Icon(Icons.close):Icon(Icons.panorama_fish_eye),
        color: state.getColor(x, y),
        iconSize: state.getState(x, y) == 1 ? 100:80,
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
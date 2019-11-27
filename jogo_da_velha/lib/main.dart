import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'RandomColor.dart';
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
      home: GameIteractive(),
    );
  }
}

class GameIteractiveState extends State<GameIteractive> with SingleTickerProviderStateMixin{
  RandomColor randColor = RandomColor();
  double _fraction;

  bool playerTurn = true;

  List<List<int>> matrix = new List<List<int>>();
  List<List<Color>> matrixColor = new List<List<Color>>();

  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    var controller = AnimationController(
      duration: Duration(milliseconds: 5000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          _fraction = animation.value;
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
              playerTwo(),
              playerOne(),
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

  Widget playerTwo(){
    return Align(
      alignment: Alignment(0, -0.97),
      child: Transform.rotate(
        angle: - 3.1415927,
        child: Text(
          'Player 2',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: playerTurn ? randColor.getTransparent():Colors.white,
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
          color: playerTurn && _fraction == 1 ? Colors.white:randColor.getTransparent(),
          fontSize: 65,
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
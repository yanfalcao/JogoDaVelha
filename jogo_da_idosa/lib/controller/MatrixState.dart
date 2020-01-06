import 'package:flutter/material.dart';
import 'package:jogo_da_idosa/color/ColorsApp.dart';

class MatrixState {
    List<List<int>> _matrix = new List<List<int>>();
    List<List<Color>> _matrixColor = new List<List<Color>>();

    MatrixState(){
        for (var i = 0; i < 3; i++) {
            _matrix.add(new List<int>());
            _matrixColor.add(new List<Color>());

            for (var j = 0; j < 3; j++) {
                _matrix[i].add(0);
                _matrixColor[i].add(Transparent());
            }
        }
    }

    int getState(int x, int y){
        return _matrix[x][y];
    }

    void setState(int x, int y, int state){
        _matrix[x][y] = state;
    }

    Color getColor(int x, int y){
        return _matrixColor[x][y];
    }

    void setColor(int x, int y, Color color){
        _matrixColor[x][y] = color;
    }
}

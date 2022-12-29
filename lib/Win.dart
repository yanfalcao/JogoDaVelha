import 'package:jogo_da_idosa/controller/MatrixState.dart';

class Winner {
  static final String LINE_ONE_HORIZONTAL = "line_one_horizontal";
  static final String LINE_TWO_HORIZONTAL = "line_two_horizontal";
  static final String LINE_THREE_HORIZONTAL = "line_three_horizontal";
  static final String LINE_ONE_VERTICAL = "line_one_vertical";
  static final String LINE_TWO_VERTICAL = "line_two_vertical";
  static final String LINE_THREE_VERTICAL = "line_three_vertical";
  static final String DIAGONAL = "diagonal";
  static final String ANTI_DIAGONAL = "anti_diagonal";
  static final String CONTINUE = "continue";
  static final String NOBODY = "nobody";

  String checkWinner(MatrixState matrix){
    bool hasEmpty = false;

      if(matrix.getState(0, 0) == 1 && matrix.getState(0, 1) == 1 && matrix.getState(0, 2) == 1)
        return LINE_ONE_HORIZONTAL;
      if(matrix.getState(1, 0) == 1 && matrix.getState(1, 1) == 1 && matrix.getState(1, 2) == 1)
        return LINE_TWO_HORIZONTAL;
      if(matrix.getState(2, 0) == 1 && matrix.getState(2, 1) == 1 && matrix.getState(2, 2) == 1)
        return LINE_THREE_HORIZONTAL;
      if(matrix.getState(0, 0) == 1 && matrix.getState(1, 0) == 1 && matrix.getState(2, 0) == 1)
        return LINE_ONE_VERTICAL;
      if(matrix.getState(0, 1) == 1 && matrix.getState(1, 1) == 1 && matrix.getState(2, 1) == 1)
        return LINE_TWO_VERTICAL;
      if(matrix.getState(0, 2) == 1 && matrix.getState(1, 2) == 1 && matrix.getState(2, 2) == 1)
        return LINE_THREE_VERTICAL;
      if(matrix.getState(0, 0) == 1 && matrix.getState(1, 1) == 1 && matrix.getState(2, 2) == 1)
        return DIAGONAL;
      if(matrix.getState(2, 0) == 1 && matrix.getState(1, 1) == 1 && matrix.getState(0, 2) == 1)
        return ANTI_DIAGONAL;

      if(matrix.getState(0, 0) == 2 && matrix.getState(0, 1) == 2 && matrix.getState(0, 2) == 2)
        return LINE_ONE_HORIZONTAL;
      if(matrix.getState(1, 0) == 2 && matrix.getState(1, 1) == 2 && matrix.getState(1, 2) == 2)
        return LINE_TWO_HORIZONTAL;
      if(matrix.getState(2, 0) == 2 && matrix.getState(2, 1) == 2 && matrix.getState(2, 2) == 2)
        return LINE_THREE_HORIZONTAL;
      if(matrix.getState(0, 0) == 2 && matrix.getState(1, 0) == 2 && matrix.getState(2, 0) == 2)
        return LINE_ONE_VERTICAL;
      if(matrix.getState(0, 1) == 2 && matrix.getState(1, 1) == 2 && matrix.getState(2, 1) == 2)
        return LINE_TWO_VERTICAL;
      if(matrix.getState(0, 2) == 2 && matrix.getState(1, 2) == 2 && matrix.getState(2, 2) == 2)
        return LINE_THREE_VERTICAL;
      if(matrix.getState(0, 0) == 2 && matrix.getState(1, 1) == 2 && matrix.getState(2, 2) == 2)
        return DIAGONAL;
      if(matrix.getState(2, 0) == 2 && matrix.getState(1, 1) == 2 && matrix.getState(0, 2) == 2)
        return ANTI_DIAGONAL;

    if(matrix.getState(0, 0) == 0 || matrix.getState(0, 1) == 0 || matrix.getState(0, 2) == 0)
      hasEmpty = true;
    if(matrix.getState(1, 0) == 0 || matrix.getState(1, 1) == 0 || matrix.getState(1, 2) == 0)
      hasEmpty = true;
    if(matrix.getState(2, 0) == 0 || matrix.getState(2, 1) == 0 || matrix.getState(2, 2) == 0)
      hasEmpty = true;

    if(hasEmpty)
      return CONTINUE;
    else
      return NOBODY;

  }
}

class StatusAnimationXO{
  static final String CONTINUE = "continue";
  static final String OPACITY = "opacity";

  static String getStatus(String status, int xo){
    if(status == Winner.CONTINUE)
      return CONTINUE;

    switch(xo){
      case 0:
        if(status != Winner.LINE_ONE_VERTICAL &&
            status != Winner.LINE_ONE_HORIZONTAL &&
            status != Winner.DIAGONAL)
          return OPACITY;
        break;
      case 1:
        if(status != Winner.LINE_TWO_VERTICAL &&
            status != Winner.LINE_ONE_HORIZONTAL)
          return OPACITY;
        break;
      case 2:
        if(status != Winner.LINE_THREE_VERTICAL &&
            status != Winner.LINE_ONE_HORIZONTAL &&
            status != Winner.ANTI_DIAGONAL)
          return OPACITY;
        break;
      case 10:
        if(status != Winner.LINE_ONE_VERTICAL &&
            status != Winner.LINE_TWO_HORIZONTAL)
          return OPACITY;
        break;
      case 11:
        if(status != Winner.LINE_TWO_VERTICAL &&
            status != Winner.LINE_TWO_HORIZONTAL &&
            status != Winner.DIAGONAL &&
            status != Winner.ANTI_DIAGONAL)
          return OPACITY;
        break;
      case 12:
        if(status != Winner.LINE_THREE_VERTICAL &&
            status != Winner.LINE_TWO_HORIZONTAL)
          return OPACITY;
        break;
      case 20:
        if(status != Winner.LINE_ONE_VERTICAL &&
            status != Winner.LINE_THREE_HORIZONTAL &&
            status != Winner.ANTI_DIAGONAL)
          return OPACITY;
        break;
      case 21:
        if(status != Winner.LINE_TWO_VERTICAL &&
            status != Winner.LINE_THREE_HORIZONTAL)
          return OPACITY;
        break;
      case 22:
        if(status != Winner.LINE_THREE_VERTICAL &&
            status != Winner.LINE_THREE_HORIZONTAL &&
            status != Winner.DIAGONAL)
          return OPACITY;
        break;
    }
  }
}
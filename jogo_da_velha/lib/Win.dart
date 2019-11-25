class Winner {
  static final String ONE_WIN = "one_win";
  static final String TWO_WIN = "two_win";
  static final String CONTINUE = "continue";
  static final String NOBODY = "nobody";
  List<List<int>> _magicSquare;


  Winner(){
    _magicSquare = List<List<int>>();
    _magicSquare.add(List<int>());
    _magicSquare[0].add(8);
    _magicSquare[0].add(1);
    _magicSquare[0].add(6);
    _magicSquare.add(List<int>());
    _magicSquare[0].add(3);
    _magicSquare[0].add(5);
    _magicSquare[0].add(7);
    _magicSquare.add(List<int>());
    _magicSquare[0].add(4);
    _magicSquare[0].add(9);
    _magicSquare[0].add(2);
  }

  String checkWinner(List<List<int>> matrix){
    int lineHorizontalX;
    int lineVerticalX;
    int lineHorizontalO;
    int lineVerticalO;
    int trasverssalX = 0;
    int transverssalO = 0;
    bool hasEmptySpace = false;

    for(int i=0; i < 3; i++){
      lineHorizontalX = 0;
      lineVerticalX = 0;
      lineHorizontalO = 0;
      lineVerticalO = 0;

      for(int j=0; j < 3; j++){
        if(matrix[i][j] == 0)
          hasEmptySpace = true;
        if(i == j){
          if(matrix[i][j] == 1)
            trasverssalX += matrix[i][j];
          else if(matrix[i][j] == 2)
            transverssalO += matrix[i][j];
        }
        if(matrix[i][j] == 1)
          lineHorizontalX += _magicSquare[i][j];
        if(matrix[i][j] == 1)
          lineHorizontalO += _magicSquare[i][j];
        if(matrix[j][i] == 2)
          lineVerticalX += _magicSquare[j][i];
        if(matrix[j][i] == 2)
          lineVerticalO += _magicSquare[j][i];
      }

      if(lineHorizontalX == 15)
        return ONE_WIN;
      else if(lineHorizontalO == 15)
        return TWO_WIN;
      else if(lineVerticalX == 15)
        return ONE_WIN;
      else if(lineVerticalO == 15)
        return TWO_WIN;
    }

    if(trasverssalX == 15)
      return ONE_WIN;
    if(transverssalO == 15)
      return TWO_WIN;
    if(matrix[0][2] == 1 && matrix[1][1] == 1 && matrix[2][0] == 1)
      return ONE_WIN;
    if(matrix[0][2] == 2 && matrix[1][1] == 2 && matrix[2][0] == 2)
      return TWO_WIN;
    if(hasEmptySpace)
      return CONTINUE;
    else
      return NOBODY;
  }
}
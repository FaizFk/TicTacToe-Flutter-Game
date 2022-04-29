import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils.dart';
import 'result_page.dart';

class MainGame extends StatefulWidget {
  MainGame(@required this.Player1, @required this.Player2);

  String Player1;
  String Player2;

  @override
  State<MainGame> createState() => _MainGameState(Player1, Player2);
}

class Player {
  static const none = '';
  static const X = 'X';
  static const O = 'O';
}

class _MainGameState extends State<MainGame> {
  _MainGameState(this.Player1, this.Player2);

  String Player1;
  String Player2;

  static final countMatrix = 3;
  static final double size = 92;

  String lastMove = Player.none;
  List<List<String>>? matrix;

  @override
  void initState() {
    super.initState();

    setEmptyFields();
  }

  void setEmptyFields() => setState(() => matrix = List.generate(
        countMatrix,
        (_) => List.generate(countMatrix, (_) => Player.none),
      ));

  Color getBackgroundColor() {
    final thisMove = lastMove == Player.X ? Player.O : Player.X;

    return getFieldColor(thisMove).withAlpha(150);
  }

  Widget buildRow(int x) {
    final values = matrix?[x];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: Utils.modelBuilder(
        values!,
        (y, value) => buildField(x, y),
      ),
    );
  }

  Color getFieldColor(String value) {
    switch (value) {
      case Player.O:
        return Colors.blue;
      case Player.X:
        return Colors.red;
      default:
        return Colors.white;
    }
  }

  Widget buildField(int x, int y) {
    final value = matrix![x][y];
    final color = getFieldColor(value);

    return Container(
      margin: EdgeInsets.all(4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(size, size),
          primary: color,
        ),
        child: Text(value, style: TextStyle(fontSize: 32)),
        onPressed: () => selectField(value, x, y),
      ),
    );
  }

  void selectField(String value, int x, int y) {
    if (value == Player.none) {
      final newValue = lastMove == Player.X ? Player.O : Player.X;

      setState(() {
        lastMove = newValue;
        matrix![x][y] = newValue;
      });

      if (isWinner(x, y)) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ResultPage(lastMove == Player.X ? Player1 : Player2)));
      } else if (isEnd()!) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ResultPage('Nobody')));
      }
    }
  }

  bool? isEnd() =>
      matrix?.every((values) => values.every((value) => value != Player.none));

  /// Check out logic here: https://stackoverflow.com/a/1058804
  bool isWinner(int x, int y) {
    var col = 0, row = 0, diag = 0, rdiag = 0;
    final player = matrix![x][y];
    final n = countMatrix;

    for (int i = 0; i < n; i++) {
      if (matrix![x][i] == player) col++;
      if (matrix![i][y] == player) row++;
      if (matrix![i][i] == player) diag++;
      if (matrix![i][n - i - 1] == player) rdiag++;
    }
    return row == n || col == n || diag == n || rdiag == n;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${lastMove == Player.X ? Player2 : Player1} Turn',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 12,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    Utils.modelBuilder(matrix!, (x, value) => buildRow(x)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

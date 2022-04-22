import 'package:flutter/material.dart';

class MainGame extends StatefulWidget {
  MainGame(@required this.Player1, @required this.Player2);

  String Player1;
  String Player2;

  @override
  State<MainGame> createState() => _MainGameState(Player1, Player2);
}

class _MainGameState extends State<MainGame> {
  _MainGameState(this.Player1, this.Player2);

  String Player1;
  String Player2;

  @override
  Widget build(BuildContext context) {
    return Text(Player1);
  }
}

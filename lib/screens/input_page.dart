import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/main_game_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String Player1 = "Player1";
  String Player2 = "Player2";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Player1 Name',
                style: kPlayerNameLabelStyle,
              ),
              TextField(
                onChanged: (value) {
                  if (value != '') Player1 = value;
                },
                maxLength: 12,
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Player2 Name',
                style: kPlayerNameLabelStyle,
              ),
              TextField(
                onChanged: (value) {
                  if (value != '') Player2 = value;
                },
                maxLength: 12,
              ),
            ],
          ),
        ),
        RawMaterialButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MainGame(Player1, Player2)));
          },
          fillColor: Colors.green[600],
          child: Text(
            'Start',
            style: kStartButtonStyle,
          ),
        )
      ],
    );
  }
}

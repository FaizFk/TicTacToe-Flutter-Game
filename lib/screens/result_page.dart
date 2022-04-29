import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/input_page.dart';

class ResultPage extends StatelessWidget {
  ResultPage(@required this.winnerName);
  String winnerName;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$winnerName has won',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                SizedBox(
                  height: 40,
                ),
                RawMaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => InputPage()));
                    },
                    padding: EdgeInsets.all(7),
                    fillColor: Colors.red[700],
                    child: Text(
                      'Play Again',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 40),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

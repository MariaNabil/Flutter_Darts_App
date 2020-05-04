import 'package:flutter/material.dart';

Widget StartGamePage(BuildContext context) {
  String player1 = "";
  String player2 = "";
  final _biggerFont = const TextStyle(fontSize: 20.0, color: Colors.white70);

  Widget _inputText(String player) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: TextField(
        decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 20, color: Colors.white24),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            hintText: 'Player Name'),
        onChanged: (text) {
          if (player == "player1") {
            player1 = text;
          } else {
            player2 = text;
          }
        },
      ),
    );
  }

  Widget _row(String player) {
    return Container(
        margin: EdgeInsets.only(
          left: 50.0,
          right: 50,
        ),
        child: Row(
          children: <Widget>[
            Text(
              player,
              style: _biggerFont,
            ),
            Expanded(
              child: _inputText("player1"),
            )
          ],
        ));
  }

  return Container(
    padding: const EdgeInsets.only(top: 50),
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/11.png"), fit: BoxFit.cover)),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(children: <Widget>[
          Container(
            color: Colors.transparent,
            height: 20,
          ),
          Expanded(
            flex: 1,
            child: _row("Player 1 : "),
          ),
          Expanded(
            flex: 1,
            child: _row("Player 2 : "),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: RaisedButton(
                padding: const EdgeInsets.only(
                    right: 40, left: 40, top: 20, bottom: 20),
                color: Colors.transparent,
                child: Text(
                  'NEXT',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold),
                ),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                  side: BorderSide(
                    width: 2,
                    color: Colors.white60,
                  ),
                ),
                onPressed: () {
                  print(player1 + " " + player2);
                }),
          ),
          Expanded(
            flex: 6,
            child: Container(),
          )
        ]),
      ),
    ),
  );
}

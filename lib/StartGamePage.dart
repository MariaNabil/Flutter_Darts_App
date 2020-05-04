import 'package:flutter/material.dart';

Widget StartGamePage(BuildContext context) {
  String player1 = "";
  String player2 = "";
  final _biggerFont = const TextStyle(fontSize: 18.0);

  return Scaffold(
    appBar: AppBar(
      title: Text('Hello'),
    ),
    body: Center(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('Player 1 :'),
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                    border: new UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                    hintText: 'Enter Player1 Name'),
                onChanged: (text) {
                  player1 = text;
                },
              ))
            ],
          ),
          Row(
            children: <Widget>[
              Text('Player 2 :'),
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                    border: new UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                    hintText: 'Enter Player2 Name'),
                onChanged: (text) {
                  player2 = text;
                },
              ))
            ],
          ),
          RaisedButton(
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
              })
        ],
      ),
    ),
  );
}

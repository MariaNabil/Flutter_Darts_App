import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../globals.dart' as globals;
import 'StartGamePage.dart';

//then hanzawed button new game w hanemsa7 fih kol el globals
Widget FinishGameScreen(BuildContext context) {
  return Container(
      padding: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/11.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            Text(
              'The Winner is : ' + globals.player,
              style: TextStyle(fontSize: 30, color: Colors.white70),
            ),
            RaisedButton(
                padding: const EdgeInsets.only(
                    right: 40, left: 40, top: 20, bottom: 20),
                color: Colors.transparent,
                child: Text(
                  'START NEW GAME',
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
                  globals.emptyDartboardImage = null;
                  globals.player1 = "";
                  globals.player2 = "";
                  globals.score = 501;
                  globals.player1Score = globals.score;
                  globals.player2Score = globals.score;
                  globals.round = 1;
                  //globals.player=

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(
                      // Add 20 lines from here...
                      builder: (BuildContext context) {
                        return StartGamePage(context);
                      },
                    ),
                  );
                }),
          ],
        ),
      ));
}

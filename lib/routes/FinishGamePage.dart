import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../globals.dart' as globals;

//then hanzawed button new game w hanemsa7 fih kol el globals
Widget FinishGameScreen() {
  return Container(
      padding: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/11.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text(
            'The Winner is : ' + globals.player,
            style: TextStyle(fontSize: 30, color: Colors.white70),
          ),
        ),
      ));
}

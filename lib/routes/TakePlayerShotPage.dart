import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_video_tutorial/routes/FinishGamePage.dart';
import 'package:image_picker/image_picker.dart';

import '../globals.dart' as globals;
import '../python.dart';

TextStyle _textStyle = TextStyle(fontSize: 20, color: Colors.white70);
//File image = null;
int new_shot = 0;
int previous_score = 0;
int total_score = 0;
String playerName = "";

Widget TakePlayerShotScreen(BuildContext context) {
  if (globals.player == globals.player1) {
    previous_score = globals.player1Score;
  } else {
    previous_score = globals.player2Score;
  }
  print("Player : " + globals.player);
  print("PREV_SCORE = " + previous_score.toString());
  return MaterialApp(
    home: MyHomePage(),
  );
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    new_shot = getScore(image);

    if (globals.player == globals.player1) {
      globals.player1Score -= new_shot;
      total_score = globals.player1Score;
    } else if (globals.player == globals.player2) {
      globals.player2Score -= new_shot;
      total_score = globals.player2Score;
    }

    if (globals.player1Score <= 0 || globals.player2Score <= 0) {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          // Add 20 lines from here...
          builder: (BuildContext context) {
            return FinishGameScreen();
          },
        ),
      );
    }
    setState(() {
      _image = image;
    });
  }

  Widget _iconWidget() {
    return Expanded(
      flex: 2,
      child: IconButton(
        icon: Icon(
          _image == null ? Icons.add_a_photo : Icons.done,
          color: Colors.white70,
        ),
        onPressed: () {
          getImage();
        },
        iconSize: 100,
        alignment: Alignment.bottomCenter,
      ),
    );
  }

  Widget _buttonWidget() {
    return Opacity(
      opacity: _image == null ? 0.0 : 1.0,
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: RaisedButton(
            padding:
                const EdgeInsets.only(right: 40, left: 40, top: 20, bottom: 20),
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
            onPressed: _image == null
                ? null
                : () {
                    globals.round += 1;
                    if (globals.round > 3) {
                      globals.round = 0;
                      if (globals.player == globals.player1) {
                        globals.player = globals.player2;
                      } else {
                        globals.player = globals.player1;
                      }
                    }
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return TakePlayerShotScreen(context);
                        },
                      ),
                    );
                  }),
      ),
    );
  }

  Widget _textWidget(text1, text2) {
    return Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.center,
        child: Opacity(
          opacity: _image == null ? 1.0 : 1.0,
          child: Text(
            _image == null ? text1 : text2,
            style: _textStyle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withAlpha(100), BlendMode.darken),
              image: AssetImage("assets/images/11.png"),
              fit: BoxFit.cover)),
      child: new BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: <Widget>[
                Expanded(flex: 1, child: Container()),
                Expanded(
                  child: Text(
                    globals.player,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Round : ' + globals.round.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                _iconWidget(),
                _textWidget(
                    'Take Payer1 Shot Photo', 'Image Taken Successfully'),

                //Expanded(flex: 1, child: Container()),
                _textWidget(
                    'Previous Score : ' + previous_score.toString(), ''),
                _textWidget(
                    '', 'Previous Score : ' + previous_score.toString()),

                Container(
                  padding: EdgeInsets.only(left: 80, right: 80),
                  child: Opacity(
                    opacity: _image == null ? 0 : 1.0,
                    child: Divider(
                      color: Colors.white70,
                      thickness: 2,
                    ),
                  ),
                ),
                _textWidget('', 'Total Score : ' + total_score.toString()),

                Expanded(flex: 1, child: Container()),

                _buttonWidget(),
              ],
            ),
          )),
    );
  }
}

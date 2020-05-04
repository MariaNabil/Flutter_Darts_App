import 'package:flutter/material.dart';

TextStyle _textStyle = TextStyle(fontSize: 20, color: Colors.white70);

Widget TakePicsScreen(BuildContext context, String player1, String player2) {
  return Container(
    padding: const EdgeInsets.only(top: 50),
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/11.png"), fit: BoxFit.cover)),
    child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: <Widget>[
              /* Expanded(
                flex: 1,
                child: Text(
                  'Hello ' + player1 + ' and ' + player2,
                  style: TextStyle(fontSize: 30, color: Colors.white70),
                ),
              ),*/

              Container(
                height: 60,
              ),
              Expanded(
                flex: 1,
                child: Icon(
                  Icons.photo_camera,
                  color: Colors.white70,
                  size: 100,
                ),
              ),
              Text(
                'Take Empty Dartboard Photo',
                style: _textStyle,
              ),
              Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.transparent,
                  )),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
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
                        if (player1 == '' ||
                            player1 == null ||
                            player2 == '' ||
                            player2 == null) {
                          //SHOW ALERT
                          return;
                        }
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            // Add 20 lines from here...
                            builder: (BuildContext context) {
                              return TakePicsScreen(context, player1, player2);
                            },
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        )),
  );
}

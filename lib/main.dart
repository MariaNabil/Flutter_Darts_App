import 'package:flutter/material.dart';

/* #region */
/*main() {
  runApp(Center(
    child: Text(
      'Hello Flutter Developer',
      textDirection: TextDirection.ltr,
    ),
  ));
}*/
/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('First App'),
      ),
      body: Center(
        child: Text(
          'Hello Flutter Maria Developer',
          style: TextStyle(fontSize: 20),
        ),
      ),
    ));
  }
}*/

/**/
/* #endregion */

main() {
  runApp(MyApp());
}

/*class MyApp extends StatelessWidget {
  int counter = 0;
  @override
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/11.png"), fit: BoxFit.fitHeight),
      ),
      // child: Center(child: FlutterLogo(size: 300)),
      // child: RaisedButton(
      //     child: Text('Click Me'),
      //     onPressed: () {
      //       //call build
      //       //setState(() {
      //       //  counter++;
      //       // });
      //       print('Counter is');
      //     }),
    );
  }
}*/
/*class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('First App'),
          ),
          body: Column(
            children: <Widget>[
              Text(
                'This button is clicked  $counter times',
                style: TextStyle(fontSize: 22),
              ),
              RaisedButton(
                  child: Text('Click Me'),
                  onPressed: () {
                    //call build
                    setState(() {
                      counter++;
                    });
                    print('Counter is $counter');
                  })
            ],
          )),
    );
  }
}
*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: Container(
          padding: const EdgeInsets.only(top: 100),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/11.png"),
                  fit: BoxFit.cover)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              //title: Text('My App'),
              centerTitle: true,
              /*leading: IconButton(
                  icon: Icon(
                    Icons.list,
                    color: Colors.white,
                  ),
                  onPressed: () {}),*/
            ),
            body: Row(
              //mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    padding: const EdgeInsets.only(
                        right: 40, left: 40, top: 20, bottom: 20),
                    color: Colors.transparent,
                    child: Text(
                      'START GAME',
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
                      print('Counter is');
                    }),
              ],
            ),
          ),
        ));
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

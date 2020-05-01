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

/*class MyApp extends StatelessWidget {
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
                    counter++;
                    print('Counter is $counter');
                  })
            ],
          )),
    );
  }
}*/
/* #endregion */

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
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

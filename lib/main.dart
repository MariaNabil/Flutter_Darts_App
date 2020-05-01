import 'dart:developer';

import 'package:flutter/material.dart';

/*main() {
  runApp(Center(
    child: Text(
      'Hello Flutter Developer',
      textDirection: TextDirection.ltr,
    ),
  ));
}*/

main() {
  runApp(MyApp());
}

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

class MyApp extends StatelessWidget {
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
              Checkbox(
                  value: false,
                  onChanged: (value) {
                    counter++;
                    print('Counter is $counter');
                  })
            ],
          )),
    );
  }
}

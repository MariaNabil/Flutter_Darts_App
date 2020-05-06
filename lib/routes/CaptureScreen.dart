import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

TextStyle _textStyle = TextStyle(fontSize: 20, color: Colors.white70);
//File image = null;

Widget TakePictureScreen(BuildContext context, String player1, String player2) {
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

    ///image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  Widget _iconWidget() {
    return Expanded(
      flex: 1,
      child: IconButton(
        icon: Icon(
          _image == null ? Icons.add_a_photo : Icons.done,
          color: Colors.white70,
        ),
        onPressed: () {
          getImage();
        },
        iconSize: 100,
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
            onPressed: _image == null ? null : () {}),
      ),
    );
  }

  Widget _textWidget() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Text(
        _image == null
            ? 'Take Empty Dartboard Photo'
            : 'Image Taken Successfully',
        style: _textStyle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/11.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            Container(
              height: 60,
            ),
            _iconWidget(),
            _textWidget(),
            Expanded(
                flex: 4,
                child: Container(
                  color: Colors.transparent,
                )),
            _buttonWidget(),
          ],
        ),
      ),
    );
  }
}

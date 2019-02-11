import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  Future<File> _filePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: new RaisedButton(
          onPressed: () {
            _filePath = ImagePicker.pickImage(source: ImageSource.gallery);
            _filePath.then((File file) {
              print("Selected Iamge Path->" + file.path.toString());
            }).catchError((e) {
              print(e.toString());
            });
          },
          padding: EdgeInsets.all(20.0),
          textColor: Colors.white,
          child: new Text("Pick Image"),
          color: Colors.blue,
        ),
      ),
    );
  }
}

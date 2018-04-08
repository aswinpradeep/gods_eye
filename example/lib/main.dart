import 'package:flutter/material.dart';
import 'package:image_picker_example/home.dart';
import 'package:image_picker_example/old_main.dart';
import 'package:image_picker_example/jsonnet.dart';
import 'package:image_picker_example/tts.dart';
import 'package:image_picker_example/emotion_det.dart';
import 'package:image_picker_example/emotionnet.dart';
import 'package:image_picker_example/face_det.dart';
import 'package:image_picker_example/facenet.dart';


//import 'package:miniproject1/screens/second.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return new MaterialApp
    (
      title: 'miniproject1',
      /*theme: new ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.orangeAccent,
    accentColor: Colors.cyan[600],
  ),*/
      routes: <String,WidgetBuilder>
      {
        '/Home':(BuildContext context) => new Home(),
        '/second':(BuildContext context) => new MyHomePage(),
        '/third':(BuildContext context) => new HomePage(),
       '/forth':(BuildContext context) => new MyHomePagex(),
       '/fifth':(BuildContext context) => new HomePagex(),
       '/sixth':(BuildContext context) => new MyHomePagey(),
       '/seventh':(BuildContext context) => new HomePagey(),

        
      },
      home: new Home(),
    );
  }
}
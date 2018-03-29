import 'package:flutter/material.dart';
import 'package:image_picker_example/home.dart';
import 'package:image_picker_example/old_main.dart';
import 'package:image_picker_example/jsonnet.dart';
import 'package:image_picker_example/tts.dart';
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
      routes: <String,WidgetBuilder>
      {
        '/Home':(BuildContext context) => new Home(),
        '/second':(BuildContext context) => new MyHomePage(),
        '/third':(BuildContext context) => new HomePage(),
       // '/forth':(BuildContext context) => new MyAppx(),
        
      },
      home: new Home(),
    );
  }
}
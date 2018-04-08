import 'package:flutter/material.dart';

class Home extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
    (
      appBar: new AppBar(title: new Text("Home"),
      backgroundColor: Colors.tealAccent[700]
    ),
      body: new Container
      (

        decoration: new BoxDecoration(image: new DecorationImage(image: new AssetImage("assets/explorer.jpeg"),fit: BoxFit.cover)),

        padding: new EdgeInsets.all(35.0),
        child: new Center
        (
          child: new Column
          (
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>
            [
              //new Text('\n  HOME MENU \n',textAlign:TextAlign.center),
              //new Text("\n"),
              new RaisedButton
              (
                child: new Text('Object detection',),
                onPressed: (){Navigator.of(context).pushNamed('/second');},
              ),
              new Text("\n"),
              new RaisedButton
              (
                child: new Text('Face detection',),
                onPressed: (){Navigator.of(context).pushNamed('/sixth');},
              ),
              new Text("\n"),
              new RaisedButton
              (
                child: new Text('Emotion detection',),
                onPressed: (){Navigator.of(context).pushNamed('/forth');},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
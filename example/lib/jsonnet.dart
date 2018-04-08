import 'dart:async';
import 'dart:convert';
import 'package:tts/tts.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  String $r;
 Map $parsedMap;
   var $objs;
  var $l=new List();
  var $objkeys;
  List data;

  Future<String> getData() async {
//$r= '{"objects": {"fine-looking": 0.8489355, "boy": 0.8434571, "wear": 0.9084894, "woman": 0.7861929, "pensive": 0.79124653, "family": 0.7873902, "people": 0.991938, "outdoors": 0.8124131, "child": 0.809623, "telephone": 0.8670113, "one": 0.9717355, "serious": 0.7867582, "connection": 0.78743315, "indoors": 0.9330189, "music": 0.86528695, "adult": 0.9741019, "facial expression": 0.9374069, "portrait": 0.9729613, "casual": 0.7928367, "man": 0.99308306}, "faces": {"emotion": {"neutral": 99.977, "sadness": 0.0, "disgust": 0.007, "anger": 0.004, "surprise": 0.002, "fear": 0.0, "happiness": 0.01}, "gender": {"value": "Male"}, "age": {"value": 25}, "ethnicity": {"value": "White"}, "beauty": {"female_score": 66.455, "male_score": 67.622}}}';

var response = await http.get(
      Uri.encodeFull("http://13.127.92.249:5000/static/data.json"),
      headers: {
        "Accept": "application/json"
      });



    this.setState(() {
      //print(response.body);
      //data = JSON.decode(response.body);
      //$r=data.toString();
      $r=response.body.toString();
      $parsedMap=JSON.decode($r);
  $objs =$parsedMap['objects'];
  //;
  //var $l=new List();
  $objkeys=$objs.keys;
  for(var i in $objkeys){
    if($objs[i]>0.92){
      $l.add(i);
      //speak();
    }
  }
    });
    
  }
speak() async {
  //print("test print=="+data[1]["email"]);
  var $q="";
  var $r;
  for(int $j=0;$j<$l.length;$j++)
  {
    $r=$l[$j];
    $q=$q+" "+$r.toString()+" . ";

  }
Tts.speak('The photo consists of objects such as . .'+$q);
}

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Results"),
        backgroundColor: Colors.red,
        actions: <Widget>
        [
          new IconButton(icon: new Icon(Icons.speaker_phone),onPressed:(speak)),
          new IconButton(icon: new Icon(Icons.home),onPressed: (){Navigator.of(context).pushNamedAndRemoveUntil('/Home', (Route<dynamic> route) => false);/*Navigator.of(context).pushNamed('/Home');*/},)
        ],
      ),
      body: 
    
      new ListView.builder(
        
        itemCount: $l == null ? 0 : $l.length,
        itemBuilder: (BuildContext context,int index)
        {
          return new Container
          (
            child: new Center
            (
              child: new Column
              (
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>
                [
                  new Card
                  (
                    child: new Container
                    ( 
                      child: new Text($l[index]),
                      padding: const EdgeInsets.all(20.0),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      //new RaisedButton(child: new Text('speak me'),onPressed: null,)
    );
  }
}

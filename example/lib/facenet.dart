import 'dart:async';
import 'dart:convert';
import 'package:tts/tts.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomePagey extends StatefulWidget {
  @override
  HomePageyState createState() => new HomePageyState();
}

class HomePageyState extends State<HomePagey> {

  String $r;
 Map $parsedMap;
   var $objs;
  var $l=new List();
  var $objkeys;
  List data;
  var $emotion;
  var $emotion_score;
  var $f_emotion;
  Map $face;
  var $gender;
  var $ethnicity;
  var $beauty;
  var $resp;
  String $resp2;
  var $age;
  var $ll=new List();


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
      //
      $parsedMap=JSON.decode($r);
  $objs =$parsedMap['objects'];
  //;
  //var $l=new List();
  $objkeys=$objs.keys;
  for(var i in $objkeys){
    if($objs[i]>0.92){
      $l.add(i);
    }
  }
      //
  $parsedMap=JSON.decode($r);
  $face=$parsedMap['faces'];
  print("*****");
  print($face.length);
  if($face.length > 5)
  {
  $emotion=$face['emotion'];
  print($emotion);
  $emotion_score=0.0;
  $f_emotion='';
  print($emotion_score);
  print($f_emotion);
  for(var i in $emotion.keys){
    if($emotion[i]>$emotion_score){
      $emotion_score=$emotion[i];
      $f_emotion=i;
     }
}
  print($emotion_score);
  $gender=$face['gender']['value'];
  print($gender);
  $age=$face['age']['value'];
  print($age);
  $ethnicity=$face['ethnicity']['value'];
  print($ethnicity);
  $beauty='';
  if($gender=='Male'){
    $beauty=$face['beauty']['male_score'];
  }
  else{
    $beauty=$face['beauty']['female_score'];
  }
  print($beauty);
  }
  //$resp="A "+$age+" year old "+$ethnicity+""+ $gender+" which seems to be looking "+$f_emotion+" and have beauty score of"+ $beauty+"";
   //$resp="________";
  
  //print($resp);
  
  //$ll=new List();
  $ll.add($gender);
  $ll.add($age);
  //$ll.add($f_emotion);
  //$ll.add('custom value');
  //$ll.clear();

 // print($ll);
  //print($l);
  if($face.length > 5)
  {
$l.clear();
$l.add($face['name']);
print($l);
  }

    });
    
  }

speak() async {
  if($face.length > 5)
  {
Tts.speak("The person in photo is.."+$face['name']);
}
else
{ 
  //Tts.speak("Rather than faces I am seeing ");
  var $q="";
  var $r;
  for(int $j=0;$j<$l.length;$j++)
  {
    $r=$l[$j];
    $q=$q+" "+$r.toString()+" . ";

  }
Tts.speak('Rather than faces I am seeing'+$q);

  }//Tts.speak($resp);
//Tts.speak($gender);
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
        backgroundColor: Colors.lightGreen,
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
          (        //decoration: new BoxDecoration(image: new DecorationImage(image: new AssetImage("assets/explorer.jpeg"),fit: BoxFit.cover)),

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

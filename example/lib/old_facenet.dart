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

  List data;

  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull("http://13.127.92.249:5001/static/mainJson.json"),
      headers: {
        "Accept": "application/json"
      

      }
    );

    this.setState(() {
      data = JSON.decode(response.body);
    });
    var $y="";
    var $x;
    for(int $i=0;$i<5;$i++)
    {$x=data[$i]["name"];
    print($x.toString());
    $y=$y+"  "+$x.toString()+"  ";
    }
    print("final output="+$y);
    return "Success!";
   //speak() async {
  //Tts.speak('Hello World');
  }
speak() async {
  //print("test print=="+data[1]["email"]);
  var $q="";
  var $r;
  for(int $j=0;$j<data.length;$j++)
  {
    $r=data[$j]["name"];
    $q=$q+" "+$r.toString()+" . ";

  }
Tts.speak('The person in screen is . .'+$q);
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
        actions: <Widget>
        [
          new IconButton(icon: new Icon(Icons.speaker_phone),onPressed:(speak)),
          new IconButton(icon: new Icon(Icons.home),onPressed: (){Navigator.of(context).pushNamed('/Home');},)
        ],
      ),
      body: 
    
      new ListView.builder(
        
        itemCount: data == null ? 0 : data.length,
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
                      child: new Text(data[index]['name']),
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
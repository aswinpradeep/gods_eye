import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';
//import 'package:tts/tts.dart';
//import 'dart:math';

class MyHomePagex extends StatefulWidget {
  @override
  _MyHomePagexState createState() => new _MyHomePagexState();
}

class _MyHomePagexState extends State<MyHomePagex> {
  File imageFile;
  String image_encode= 'image encoder';



  getImage() async {
    var _fileName = await ImagePicker.pickImage();
    setState(() {
      imageFile = _fileName;
      
    });
    Stream<List<int>> stream = imageFile.openRead();
    stream.transform(BASE64.encoder)
        .transform(const LineSplitter())
        .listen((line){
      setState((){
        image_encode = line;
      });
    });
  }
//speak() async {
  //Tts.speak('Hello World');
//}



  sendimage() async {

    var httpclient = createHttpClient();
    var data = {"nama":"default","gambar":image_encode};
    var send = await httpclient.post("http://13.127.92.249:8080/file",body: data);// dont forget to change its server target
    Map respon = JSON.decode(send.body);

    bool status = respon["Stats"];
    if (status){

    }else{

    }
    setState((){
      image_encode = '';
      imageFile = null;
      Navigator.of(context).pushNamed('/fifth');
    });
  }

  @override
  Widget build(BuildContext context) {
    var isi_menu_home = [];
    isi_menu_home.add(
        imageFile == null
        ? new Text('No image selected!',textAlign:TextAlign.center,)
        : new Image.file(imageFile));
    isi_menu_home.add(new Text("\n"));

    isi_menu_home.add(new FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: new Icon(Icons.add_a_photo),
        backgroundColor: Colors.lightGreen,
        
      ),);

          isi_menu_home.add(new Text("\n"));

    isi_menu_home.add(new RaisedButton(onPressed: sendimage,child: new Text("Upload\n"),));
    /*isi_menu_home.add(new Text("\nHit the button below after upload!",textAlign:TextAlign.center,));
    //isi_menu_home.add(new Text("else you will be seeing the details of last uploaded image",textAlign:TextAlign.center,));

    isi_menu_home.add(new Text("\n"));
    isi_menu_home.add(new RaisedButton
              (
                child: new Text('View result'),
                onPressed: (){Navigator.of(context).pushNamed('/fifth');},
              ));*/
    
/*
              isi_menu_home.add(new RaisedButton
              (
                child: new Text('object detection speech'),
                onPressed: (){Navigator.of(context).pushNamed('/forth');},
              ));

              isi_menu_home.add(new RaisedButton
              (
                child: new Text('speak me'),
                onPressed: (speak),
              ));
*/


    return new Scaffold(
      appBar: new AppBar(
        title: new Text('choose image'),
        backgroundColor: Colors.lightGreen,
        actions: <Widget>
        [
          new IconButton(icon: new Icon(Icons.home),onPressed: (){Navigator.of(context).pushNamedAndRemoveUntil('/Home', (Route<dynamic> route) => false);},)
        ],
      ),
      body: 
      
      new Container(       //decoration: new BoxDecoration(image: new DecorationImage(image: new AssetImage("assets/explorer.jpeg"),fit: BoxFit.cover)),

              padding: new EdgeInsets.all(32.0),
//
         /* child: new Column
          (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>
            [
                    new Center
                    ( child: new Column
                    (
                      children:isi_menu_home,
                    ),
                      //chchildren: isi_menu_home
                      ),

            ],
          ),    */          

       child:new Center(child :new ListView(children: isi_menu_home)),
      
      ),
      
    );
  }
}



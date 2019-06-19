import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:io';

void main() async {
  runApp(new MaterialApp(
    title: "readwrite",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _enterDataField = new TextEditingController();
  var _savedData;
  @override
  void initState() {
    super.initState();
    _loadSavedMessage();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Shared Preferences"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: new Container(
        margin: const EdgeInsets.all(10.0),
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Padding(padding: new EdgeInsets.all(5.5)),
            new Container(
              child: new Column(
                children: <Widget>[
                  new Padding(padding: new EdgeInsets.all(5.5)),
                  new TextField(
                    controller: _enterDataField,
                    decoration: new InputDecoration(
                      labelText: "Type Something",
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(6.5)),
                  new RaisedButton(
                    onPressed: () {
                      _saveMessage(_enterDataField.text);
                    },
                    color: Colors.red,
                    child: new Text("Save",
                        style:
                            new TextStyle(color: Colors.white, fontSize: 16.9)),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.5)),
                  new Text(_savedData),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

   _saveMessage(String text) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("key", text);
   }

   _loadSavedMessage() async{
     SharedPreferences preferences = await SharedPreferences.getInstance();
     setState(() {
       if(preferences.getString("key") != null){
         _savedData = preferences.getString("key");
       }else{
         _savedData = "empty SP";
       }
     });
   }
}

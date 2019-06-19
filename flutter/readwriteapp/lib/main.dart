import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

void main() async{
  var data = await _readData();
  if(data != null){
    String message = await _readData();
    debugPrint(message);
  }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Read/Write"),
        centerTitle: true,
        backgroundColor: Colors.green,
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
                  new Center(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          child: new RaisedButton(
                            onPressed: ()=>_writeData(_enterDataField.text),
                            color: Colors.green,
                            child: new Text("Save",
                                style: new TextStyle(
                                    color: Colors.white, fontSize: 16.9)),
                          ),
                        ),
                        new Container(
                          margin:
                              const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                          child: new FutureBuilder(
                              future: _readData(),
                              builder: (BuildContext context, AsyncSnapshot<String> data){
                                if(data.hasData != null){
                                  return new Text(data.data.toString(), style: TextStyle(
                                    color: Colors.green
                                  ),);
                                }else{
                                  return new Text("No data saved");
                                }
                              }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return new File("$path/data.txt");
}

Future<File> _writeData(String message) async {
  final file = await _localFile;
  return file.writeAsString("$message");
}

Future<String> _readData() async {
  try {
    final file = await _localFile;
    String data = await file.readAsString();
    return data;
  } catch (e) {
    return "nothing!";
  }
}

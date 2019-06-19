import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

void main() {
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

  TextEditingController _textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Read/Write"),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(5.0),
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              TextField(
                controller: _textEditingController,
              ),
              RaisedButton(onPressed: ()=>_writedata(_textEditingController.text),child: Text("Save"),),
              FutureBuilder(
                  future: _readData(),
                  builder: (BuildContext context, AsyncSnapshot<String> retrievedData){
                    if(retrievedData.hasData != null){
                      return new Text(retrievedData.data.toString());
                    }else{
                      return new Text("No data saved");
                    }
                  }),
            ],
          ),
        ));
  }
}

Future<String> get _localPath async {
  var directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  var path = await _localPath;
  return new File("$path/data.txt");
}

Future<File> _writedata(String message) async {
  var file = await _localFile;
  return file.writeAsString(message);
}

Future<String> _readData() async {
  var file = await _localFile;
  try {
    String data = await file.readAsString();
    return data;
  } catch (e) {
    return "No data in file";
  }
}

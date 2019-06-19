import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  TextEditingController _textEditingController = new TextEditingController();
  String _savedData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSavedData();
  }

  saveData(String text) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("key", text);
  }

  loadSavedData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      if(preferences.getString("key")!=null){
        _savedData = preferences.getString("key");
      }else
        _savedData = "no item in share pref";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            TextField(
              controller: _textEditingController,
            ),
            RaisedButton(
              child: Text("Save"),
              onPressed: () => saveData(_textEditingController.text),
            ),
            Text(_savedData),
          ],
        ),
      ),
    );
  }
}


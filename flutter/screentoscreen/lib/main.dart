import 'package:flutter/material.dart';
import 'dart:async';


void main() {
  runApp(new MaterialApp(
    title: "Open next Screen",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _nameFieldController = new TextEditingController();
  Future _gotoNextScreen (BuildContext context) async{
      Map result = await Navigator.of(context).push(
        new MaterialPageRoute<Map>(
            builder: (BuildContext context){
              return new NextScreen(name: _nameFieldController.text);
            })
      );
      if(result!=null && result.containsKey("info")){
          _nameFieldController.text = result['info'].toString();
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("First Screen"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new TextField(
              controller: _nameFieldController,
              decoration: new InputDecoration(labelText: "Enter any string"),
            ),
          ),
          new ListTile(
            title: new RaisedButton(
                color: Colors.green,
                child: Text("Send to second screen"),
                onPressed: (){ return _gotoNextScreen(context);}),
          )
        ],
      ),
    );

  }
}

class NextScreen extends StatefulWidget {
  final String name;

  NextScreen({Key key, this.name}) : super(key: key);

  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  final _backTextFieldController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text("Second Screen"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Container(
            child: new Column(
          children: <Widget>[
            new ListTile(
              title: new Text("${widget.name}"),
            ),
            new ListTile(
              title: new TextField(
                controller: _backTextFieldController,
                decoration: new InputDecoration(labelText: "Enter any string"),
              ),
            ),
            new ListTile(
              title: new RaisedButton(
                  color: Colors.green,
                  child: Text("Send back to first screen"),
                  onPressed: (){
                    Navigator.pop(context,{'info' : _backTextFieldController.text});
                  }),
            )
          ],
        )));
  }
}

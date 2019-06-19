import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

Map _data;
List _features;

void main() async {
  _data = await getQuakes();
  _features = _data['features'];


  runApp(new MaterialApp(
    title: "Quake",
    home: new Quakes(),
  ));
}

class Quakes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Quakes"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),

      body: new Center(
        child: ListView.builder(
            itemCount: _features.length,
            padding: const EdgeInsets.all(5.0),
            itemBuilder: (BuildContext context, int position) {
              var format = new DateFormat.yMd().add_jm();
              var date = format.format(new DateTime.fromMicrosecondsSinceEpoch(
                  _features[position]['properties']['time'] * 1000,
                  isUtc: true));
              return new Column(
                children: <Widget>[
                  new Divider(height: 5.0),
                  ListTile(
                    title: Text("$date", style: new TextStyle(
                        color: Colors.orange,
                        fontSize: 19.5,
                        fontWeight: FontWeight.normal)),
                    subtitle: Text(
                        "${_features[position]['properties']['place']}",
                        style: new TextStyle(
                            color: Colors.grey,
                            fontSize: 14.5,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.normal)),
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text(
                        "${_features[position]['properties']['mag']}",
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 16.5,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    onTap: () {
                      _showAlertMessage(
                          context, _features[position]['properties']['title']);
                    },
                  )
                ],
              );
            }),
      ),
    );
  }

  void _showAlertMessage(BuildContext context, message) {
    var alert = new AlertDialog(
      title: new Text("Quakes"),
      content: new Text(message),
      actions: <Widget>[
        new FlatButton(onPressed: () {
          Navigator.pop(context);
        }, child: new Text("OK"))
      ],
    );
    showDialog(context: context, child: alert); 
  }
}

Future<Map> getQuakes() async {
  String apiURL =
      'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';
  http.Response response = await http.get(apiURL);
  return json.decode(response.body);
}

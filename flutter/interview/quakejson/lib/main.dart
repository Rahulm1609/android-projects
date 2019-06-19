import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Map _data;
List _features;

void main() async{
  _data = await getJson();
  _features = await _data["features"];
  //debugPrint("$_features");

  runApp(MaterialApp(
    title: "Quake Json",
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quake"),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
            itemCount: _features.length,
            itemBuilder: (_, int position){
              return new Column(
                children: <Widget>[
                  ListTile(
                    title: Text("${_features[position]["properties"]["time"]}"),
                    subtitle: Text("${_features[position]["properties"]["place"]}"),
                    leading: CircleAvatar(
                      child: Text("${_features[position]["properties"]["mag"]}"),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}

Future<Map> getJson() async {
  String apiUrl =
      "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson";
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.pink,
          title: Text("Gesture Detector"),
        ),
        body: Center(
          child: GestureDetector(
            onTap: (){
              final  snackBar = SnackBar(content: Text("Hello Gestures"));
              Scaffold.of(context).showSnackBar(snackBar);
            },
            child: new Container(
              padding:  EdgeInsets.all(20.0),
              decoration: new BoxDecoration(
                  color: Theme.of(context).buttonColor,
                  borderRadius: BorderRadius.circular(5.0)),
              child: Text("Click"),
            ),
          ),
        )
    );
  }
}

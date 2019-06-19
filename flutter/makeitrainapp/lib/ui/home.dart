import 'package:flutter/material.dart';

class MakeItRain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MakeItRainState();
  }
}

class MakeItRainState extends State<MakeItRain> {

  int _moneyCounter = 0;
  void _rainMoney()
  {
    setState(() {
      _moneyCounter = _moneyCounter + 100;

    });

  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Make it rain"),
          backgroundColor: Colors.green,
        ),
        body: new Container(
            child: new Column(
          children: <Widget>[
            new Center(
              child: new Text(
                "Get Rich!",
                style: new TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 29.9),
              ),
            ),
            new Expanded(
              child: new Center(
                child: new Text('\$$_moneyCounter',
                    style: new TextStyle(
                        color: _moneyCounter>=2000 ? Colors.green : Colors.greenAccent,
                        fontWeight: FontWeight.w800,
                        fontSize: 49.9)),
              ),
            ),
            new Expanded(
              child: new Center(
                child: new FlatButton(
                  color: Colors.green,
                    onPressed: _rainMoney,
                    child: new Text(
                      "Let it rain",
                      style: new TextStyle(fontSize: 19.9),
                    )),
              ),
            )
          ],
        )));
  }
}

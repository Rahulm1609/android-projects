import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double bmi = 0.0;
  double finalbmi = 0.0;
  String resultReading = " ";
  void calculateBMI() {
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text) * 0.3;
      double weight = double.parse(_weightController.text) * 0.45;
      if (_ageController.text.isNotEmpty ||
          age > 0 && _heightController.text.isNotEmpty ||
          height > 0 && _weightController.text.isNotEmpty ||
          weight > 0) {
         bmi = weight / (height * height);
         finalbmi = double.parse(bmi.toStringAsFixed(1));
         if(finalbmi < 18.5){
           resultReading = "Underweight";
         }
         else if(finalbmi >=18.5 && finalbmi < 25.0){
           resultReading = "Great shape";
         }
         else if(finalbmi >=25.0 && finalbmi < 30.0){
           resultReading = "Overweight";
         }
         else if(finalbmi >=30.0){
           resultReading = "Obese";
         }
      }
      else{
        return 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("BMI"),
        backgroundColor: Colors.pink,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              "images/bmilogo.png",
              height: 80.0,
              width: 130.0,
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            new Container(
                color: Colors.grey[300],
                margin: const EdgeInsets.all(8.0),
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: "Age",
                          labelStyle: new TextStyle(fontSize: 20.0),
                          hintText: "e.g 34",
                          hintStyle: new TextStyle(color: Colors.grey[500]),
                          icon: Icon(Icons.person_outline)),
                    ),
                    new TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: "Height in feet",
                          labelStyle: new TextStyle(fontSize: 20.0),
                          hintText: "e.g 6.5",
                          hintStyle: new TextStyle(color: Colors.grey[500]),
                          icon: Icon(Icons.insert_chart)),
                    ),
                    new TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: "Weight in lb",
                          labelStyle: new TextStyle(fontSize: 20.0),
                          hintText: "e.g 180",
                          hintStyle: new TextStyle(color: Colors.grey[500]),
                          icon: Icon(Icons.line_weight)),
                    ),
                    Padding(padding: EdgeInsets.all(10.0)),
                    new Container(
                      alignment: Alignment.center,
                      child: new RaisedButton(
                        onPressed: calculateBMI,
                        color: Colors.pink,
                        child: new Text(
                          "Calculate",
                          style: new TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(5.0))
                  ],
                )),
            Padding(padding: EdgeInsets.all(5.0)),
            new Container(
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new Text(
                    "Your BMI is : $finalbmi",
                    style: new TextStyle(
                        color: Colors.green,
                        fontStyle: FontStyle.italic,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(padding: EdgeInsets.all(5.0)),
                  new Text(
                    "$resultReading",
                    style: new TextStyle(
                        color: Colors.pink,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

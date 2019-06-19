import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String welcomeStr = " ";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Padding(padding: new EdgeInsets.all(5.5)),
            new Image.asset(
              'images/login.png',
              width: 90,
              height: 90,
            ),
            new Padding(padding: new EdgeInsets.all(5.5)),
            new Container(
              height: 180,
              width: 400,
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  new Padding(padding: new EdgeInsets.all(5.5)),
                  new TextField(
                    controller: _userController,
                    decoration: new InputDecoration(
                        hintText: "Username", icon: Icon(Icons.person)),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.5)),
                  new TextField(
                    controller: _passwordController,
                    decoration: new InputDecoration(
                        hintText: "Password", icon: Icon(Icons.lock)),
                    obscureText: true,
                  ),
                  new Padding(padding: new EdgeInsets.all(6.5)),
                  new Center(
                    child: new Row(
                      children: <Widget>[
                        new Container(
                            margin: const EdgeInsets.only(left: 38.0),
                            child: new RaisedButton(
                              onPressed: _showWelcome,
                              color: Colors.redAccent,
                              child: new Text("Login",
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: 16.9)),
                            )),
                        new Container(
                            margin: const EdgeInsets.only(left: 120.0),
                            child: new RaisedButton(
                              onPressed: _clear,
                              color: Colors.redAccent,
                              child: new Text("Clear",
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: 16.9)),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            new Padding(padding: new EdgeInsets.all(8.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("Welcome, $welcomeStr !",style: new TextStyle(color: Colors.white, fontSize: 19.4, fontWeight: FontWeight.w700),)
              ],
            )
          ],
        ),
      ),
    );
  }
  void _clear()
  {
    setState(() {
      _userController.clear();
      _passwordController.clear();
    });
  }
  void _showWelcome(){
    setState(() {
      if(_userController.text.isNotEmpty && _passwordController.text.isNotEmpty){
        welcomeStr = _userController.text;
      }else
        {
          welcomeStr = "nothing";
        }
    });
  }
}

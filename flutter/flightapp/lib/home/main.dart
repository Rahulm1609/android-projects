import 'package:flightapp/home/customAppBar.dart';
import 'package:flightapp/home/homeScreenBottomPart.dart';
import 'package:flutter/material.dart';
import 'package:flightapp/home/homeScreenTopPart.dart';

void main() => runApp(MaterialApp(
      title: "Flight App",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: appTheme,
    ));

Color firstColor = Color(0xFFF47D15);
Color secondColor = Color(0xFFEF772C);
List<String> locations = ["Boston", "New york city"];
ThemeData appTheme =
    ThemeData(primaryColor: Color(0xFFF3791A), fontFamily: 'Oxygen');
const TextStyle dropDownLabelStyle =
    TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle dropDownMenuStyle =
    TextStyle(color: Colors.black, fontSize: 18.0);

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomAppBar(),
      body: Column(
        children: <Widget>[
          HomeScreenTopPart(),
          homeScreenBottomPart,
        ],
      ),
    );
  }
}

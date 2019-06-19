import 'package:flutter/material.dart';
import 'ui/MasterDetailScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joke App',
      debugShowCheckedModeBanner: false,
      home: MasterDetailScreen(),
    );
  }
}



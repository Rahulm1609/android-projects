import 'package:flutter/material.dart';

class CounterAnimator extends StatefulWidget {
  @override
  _CounterAnimatorState createState() => _CounterAnimatorState();
}

class _CounterAnimatorState extends State<CounterAnimator>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.addListener(() {
      this.setState(() {
        _counter++;
        debugPrint("$_counter");
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(

      child: Text(
        controller.isAnimating ? (_counter).toStringAsFixed(2) : "Lets begin",
        style: TextStyle(fontSize: 19.0 * controller.value + 16.0),
      ),
      onTap: (){
        controller.forward(from: 0.0);
      },
    );
  }
}

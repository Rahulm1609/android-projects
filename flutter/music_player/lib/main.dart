import 'package:flutter/material.dart';
import 'package:music_player/Bottom_Controls.dart';
import 'package:music_player/songs.dart';
import 'package:music_player/theme.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.grey,
              onPressed: () {}),
          title: Text(""),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.menu), color: Colors.grey, onPressed: () {})
          ],
        ),
        body: Column(
          children: <Widget>[
            //seekbar
            Expanded(
                child: Center(
              child: Container(
                width: 125.0,
                height: 125.0,
                child: RadialSeekBar(
                  child: ClipOval(
                    clipper: CircleClipper(),
                    child: Image.network(
                      demoPlaylist.songs[0].albumArtUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            )),
            //visualizer
            Container(
              width: double.infinity,
              height: 125.0,
            ),

            //songtitle, artistname, control
            new BottomControls(),
          ],
        ));
  }
}

class RadialSeekBar extends StatefulWidget {
  final double trackWidth;
  final Color trackColor;
  final double progressWidth;
  final double progressPercent;
  final Color progressColor;
  final double thumbSize;
  final Color thumbColor;
  final double thumbPosition;
  final Widget child;

  RadialSeekBar({
    this.trackWidth = 3.0,
    this.trackColor = Colors.grey,
    this.progressWidth = 5.0,
    this.progressPercent = 0.0,
    this.progressColor = Colors.black,
    this.thumbSize = 10.0,
    this.thumbColor = Colors.black,
    this.thumbPosition = 0.0,
    this.child,
  });

  @override
  _RadialSeekBarState createState() => _RadialSeekBarState();
}

class _RadialSeekBarState extends State<RadialSeekBar> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RadialSeekBarPainter(

      ),
      child: widget.child,
    );
  }
}

class RadialSeekBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}

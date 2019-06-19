import 'package:flightapp/home/customShapeClipper.dart';
import 'package:flightapp/home/main.dart';
import 'package:flutter/material.dart';

final Color discountBackgroundColor = Color(0xFFFFE08D);
final Color flightBorderColor = Color(0xFFE6E6E6);
final Color chipBackgroundColor = Color(0xFFF6F6F6);
Color firstColor = Color(0xFFF47D15);
Color secondColor = Color(0xFFEF772C);

class FlightListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        elevation: 0.0,
        centerTitle: true,
        leading: InkWell(
            child: Icon(Icons.arrow_back_ios),
            onTap: () {
              Navigator.pop(context);
            }),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            FlightListTopPart(),
            FlightListBottomPart(),
          ],
        ),
      ),
    );
  }
}

class FlightListTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
            clipper: customShapeClipper(),
            child: Container(
              height: 160.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [firstColor, secondColor])),
            )),
        Column(
          children: <Widget>[
            Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Boston",
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Divider(
                              color: Colors.grey,
                              height: 20.0,
                            ),
                            Text(
                              "New york city",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.import_export,
                            size: 30.0,
                          ))
                    ],
                  )),
            )
          ],
        ),
      ],
    );
  }
}

class FlightListBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: 15.0,
          ),
          Text(
            "Best deals for next 6 months",
            style: dropDownMenuStyle,
          ),
          SizedBox(height: 16.0),
          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              FlightCard(),
              FlightCard(),
              FlightCard(),
              FlightCard(),
              FlightCard(),
              FlightCard(),
            ],
          )
        ],
      ),
    );
  }
}

class FlightCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 100.0,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            margin: EdgeInsets.only(
              right: 16.0,
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "\$4,159",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "(\$9,999)",
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          color: Colors.black54,
                          fontSize: 14.0),
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RawChip(
                      label: Text(
                        "June 2019",
                        style: TextStyle(fontSize: 12.0),
                      ),
                      avatar: Icon(
                        Icons.calendar_today,
                        size: 16.0,
                      ),
                    ),
                    RawChip(
                      label: Text(
                        "Jet Airways",
                        style: TextStyle(fontSize: 12.0),
                      ),
                      avatar: Icon(
                        Icons.flight,
                        size: 16.0,
                      ),
                    ),
                    RawChip(
                      label: Text(
                        "4.6",
                        style: TextStyle(fontSize: 12.0),
                      ),
                      avatar: Icon(
                        Icons.star,
                        size: 16.0,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
            right: 0.0,
            top: 15.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              decoration: BoxDecoration(
                  color: Colors.orange[200],
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Text(
                "55%",
                style: TextStyle(color: Colors.red),
              ),
            ),
          )
        ],
      ),
    );
  }
}

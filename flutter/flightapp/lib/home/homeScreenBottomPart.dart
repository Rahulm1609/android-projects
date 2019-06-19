import 'package:flutter/material.dart';
import 'package:flightapp/home/main.dart';

var homeScreenBottomPart = Column(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      child: Row(
        children: <Widget>[
          Text("Currently Watched Items", style: dropDownMenuStyle),
          Spacer(),
          Text(
            "VIEW ALL(12)",
            style: TextStyle(fontSize: 14.0, color: appTheme.primaryColor),
          )
        ],
      ),
    ),
    Container(
      height: 230.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: cityCards,
      ),
    ),
  ],
);

List<CityCard> cityCards = [
  CityCard("images/london.jpg", "london", "feb 2010", "50", "2500", "2000"),
  CityCard(
      "images/losvegas.jpg", "losvegas", "march 2010", "60", "2500", "2000"),
  CityCard("images/newyork.jpg", "newyork", "april 2010", "50", "2500", "2000"),
  CityCard("images/paris.jpeg", "paris", "june 2010", "70", "2500", "2000"),
  CityCard("images/vaticancity.jpg", "vaticancity", "july 2010", "30", "2500",
      "2000"),
];

class CityCard extends StatelessWidget {
  final String imagePath, cityName, monthYear, discount, oldPrice, newPrice;

  CityCard(this.imagePath, this.cityName, this.monthYear, this.discount,
      this.oldPrice, this.newPrice);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 180,
                  width: 150,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  height: 50.0,
                  width: 150.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.black, Colors.black12]),
                    ),
                  ),
                ),
                Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  right: 10.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            cityName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18.0),
                          ),
                          Text(
                            monthYear,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                fontSize: 14.0),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 2.0),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            color: Colors.white),
                        child: Text(
                          "$discount%",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 14.0),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "\$$newPrice",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 14.0),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                "(\$$oldPrice)",
                style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    color: Colors.black54,
                    fontSize: 14.0),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  List<BottomNavigationBarItem> bottomNavigationBarItems = [];
  var bottomNavigationBarStyle =
      TextStyle(color: Colors.black, fontStyle: FontStyle.normal);

  CustomAppBar() {
    
    bottomNavigationBarItems.add(BottomNavigationBarItem(
      activeIcon: Icon(Icons.home),
        icon: Icon(
          Icons.home,
          color: Colors.black,
        ),
        title: Text(
          "Explore",
          style: bottomNavigationBarStyle,
        )));
    bottomNavigationBarItems.add(BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite,
          color: Colors.black,
        ),
        title: Text(
          "Wishlist",
          style: bottomNavigationBarStyle,
        )));
    bottomNavigationBarItems.add(BottomNavigationBarItem(
        icon: Icon(
          Icons.local_offer,
          color: Colors.black,
        ),
        title: Text(
          "Deals",
          style: bottomNavigationBarStyle,
        )));
    bottomNavigationBarItems.add(BottomNavigationBarItem(
        icon: Icon(
          Icons.notifications,
          color: Colors.black,
        ),
        title: Text(
          "Notifications",
          style: bottomNavigationBarStyle,
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15.0,
      child: BottomNavigationBar(
        items: bottomNavigationBarItems,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

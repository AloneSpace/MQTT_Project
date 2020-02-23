import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  FirebaseUser user;

  @override
  _HomeState createState() => _HomeState();

  String getUser() {
    return this.user.toString();
  }

  Home();
  Home.setUser({this.user});
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(iconData: Icons.home, title: "Home"),
          TabData(iconData: Icons.devices, title: "Device"),
          TabData(iconData: Icons.people, title: Home().getUser()),
          TabData(iconData: Icons.search, title: "Search"),
          TabData(iconData: Icons.shopping_cart, title: "Basket")
        ],
        onTabChangedListener: onTabTapped,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app_demo_1/home/PostsPage.dart';

import 'signature/Signature.dart';

class HomeRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeRouteState();
  }
}

class HomeRouteState extends State<HomeRoute> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("test 1"),
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Hi!'),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onTabTapped, // new
          currentIndex: _currentIndex, // new
          items: [
            BottomNavigationBarItem(
                label: 'Photos',
                icon: Icon(Icons.photo),
                backgroundColor: Colors.lightBlue),
            BottomNavigationBarItem(
                label: 'Navigation',
                icon: Icon(Icons.navigation),
                backgroundColor: Colors.lightBlue),
            BottomNavigationBarItem(
                label: 'Alarms',
                icon: Icon(Icons.alarm),
                backgroundColor: Colors.lightBlue),
            BottomNavigationBarItem(
                label: 'WiFI',
                icon: Icon(Icons.wifi_sharp),
                backgroundColor: Colors.lightBlue),
          ],
        ),
        body: Center(child: _getBodyWidget()));
  }

  Widget _getBodyWidget() {
    switch (_currentIndex) {
      case 0:
        return PostsPage();
      // case 1:
      //   return
      // case 2:
      //   return "alarms";
      // case 3:
      //   return "wifi";
      default:
        return Signature();
    }
  }

  String _getText() {
    switch (_currentIndex) {
      case 0:
        return "photos";
      case 1:
        return "navigation";
      case 2:
        return "alarms";
      case 3:
        return "wifi";
      default:
        return "--";
    }
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

import 'package:badges/badges.dart';
import 'package:bottombadge/page1.dart';
import 'package:bottombadge/page2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainAppState();
  }
}

class MainAppState extends State<MainApp> {
  int _currentindex = 0;
  var showBadge = false;
  int badgeData = 0;

  Widget callpage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return Page1();
      case 1:
        return Page2(
          callback1: () {
            showBadge = true;
            setState(() {});
          },
          func1: (string) {
            if (string == 'ADD') {
              badgeData++;
            } else if (string == 'REMOVE') {
              badgeData--;
            }
            setState(() {});
          },
        );
        break;
      default:
        return Page1();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('BOTTOMNAVIGATIONBAR BADGE'),
        ),
        body: callpage(_currentindex),
        bottomNavigationBar: BottomNavigationBar(
            elevation: 10,
            currentIndex: _currentindex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.description),
                title: Text('Page-1'),
              ),
              BottomNavigationBarItem(
                  title: Text('Page-2'),
                  icon: Badge(
                      showBadge: showBadge,
                      badgeContent: Text(
                        badgeData.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      child: Icon(Icons.shopping_cart))),
            ],
            onTap: (index) {
              setState(() {
                _currentindex = index;
              });
            }),
      ),
    );
  }
}

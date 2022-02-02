import 'package:flutter/material.dart';

import 'package:donut/src/homepage/demand.dart';
import 'package:donut/src/homepage/donate.dart';
import 'package:donut/src/homepage/profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  int _current_index = 1;
  final List<Widget> _children = [
    DonatePage(),
    ProfilePage(),
    DemandPage(),
  ];
  void onTappedBar(int index) {
    setState(() {
      _current_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_current_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed
        backgroundColor: Colors.pink[200], // <-- This works for fixed
        selectedItemColor: Colors.pink[400],
        unselectedItemColor: Colors.white,

        onTap: onTappedBar,
        currentIndex: _current_index,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.favorite),
            title: new Text('Donate'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.account_circle),
            title: new Text('Profile'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.forward_rounded),
            title: new Text('Demand'),
          ),
        ],
      ),
    );
  }
}

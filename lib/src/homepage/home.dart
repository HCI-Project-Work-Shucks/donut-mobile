import 'package:donut/src/homepage/demand.dart';
import 'package:donut/src/homepage/donate.dart';
import 'package:donut/src/homepage/profile/profile_main.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  var _currentIndex = 1;
  final List<Widget> _children = [
    const DonatePage(),
    const ProfileMain(),
    const DemandPage(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // Fixed
        backgroundColor: Colors.pink[200],
        // <-- This works for fixed
        selectedItemColor: Colors.pink[400],
        unselectedItemColor: Colors.white,

        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Donate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forward_rounded),
            label: 'Demand',
          ),
        ],
      ),
    );
  }
}

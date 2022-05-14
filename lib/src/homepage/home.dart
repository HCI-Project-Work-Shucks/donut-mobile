// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:donut/src/constants.dart';
import 'package:donut/src/homepage/demand.dart';
import 'package:donut/src/homepage/donate.dart';
import 'package:donut/src/homepage/profile/profile_main.dart';
import 'package:donut/src/homepage/chat/chat.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  var _currentIndex = 1;
  final List<Widget> _children = [
    const DonatePage(),
    const profileMain(),
    const DemandPage(),
    const chat(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_current_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed
        backgroundColor: kPrimaryColor, // <-- This works for fixed
        selectedItemColor: Colors.pink[400],
        unselectedItemColor: Colors.white,

        onTap: onTappedBar,

        currentIndex: _current_index,
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
          BottomNavigationBarItem(
            icon: Icon(Icons.forward_10_outlined),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}

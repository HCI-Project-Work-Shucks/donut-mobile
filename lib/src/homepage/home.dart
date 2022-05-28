// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:donut/src/constants.dart';
import 'package:donut/src/homepage/demand/demand.dart';
import 'package:donut/src/homepage/donate/donate.dart';
import 'package:donut/src/homepage/profile/profile.dart';
import 'package:donut/src/homepage/chat/chat.dart';
import 'package:donut/src/homepage/notification/notification.dart';

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
    const Chat(),
    const Notice(),
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
        type: BottomNavigationBarType.fixed, // Fixed
        backgroundColor: kPrimaryColor, // <-- This works for fixed
        selectedItemColor: kSecondaryColor,
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
          BottomNavigationBarItem(
            icon: Icon(Icons.forward_10_outlined),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
        ],
      ),
    );
  }
}

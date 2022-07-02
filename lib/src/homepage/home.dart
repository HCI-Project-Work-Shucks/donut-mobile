// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:donut/src/constants.dart';
import 'package:donut/src/homepage/demand/demand.dart';
import 'package:donut/src/homepage/donate/donate.dart';
import 'package:donut/src/homepage/profile/profile.dart';
import 'package:donut/src/homepage/chat/chat.dart';

class Home extends StatefulWidget {
  int pos;
  Home({Key? mykey, required this.pos}) : super(key: mykey);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int pos = widget.pos;

  var _currentIndex = 1;
  late List<Widget> _children;
  void initState() {
    super.initState();
    _children = <Widget>[
      const DonatePage(),
      ProfileMain(index: pos),
      const DemandPage(),
      const Chat(),
    ];
  }

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
        ],
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}

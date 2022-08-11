// ignore_for_file: use_key_in_widget_constructors

import 'package:donut/src/constants.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: kPrimaryColor,
    title: const Text(
      "Chats",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    ),
  );
}

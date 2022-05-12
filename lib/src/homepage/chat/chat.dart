// ignore_for_file: camel_case_types

import 'package:donut/src/homepage/chat/screens/chats/chats_screen.dart';

import 'package:donut/src/theme.dart';
import 'package:flutter/material.dart';

class chat extends StatelessWidget {
  const chat({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chats',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      home: ChatsScreen(),
    );
  }
}

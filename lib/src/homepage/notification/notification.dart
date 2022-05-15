import 'package:flutter/material.dart';

import 'package:donut/src/constants.dart';

class Notice extends StatefulWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  State<Notice> createState() => _Notice();
}

class _Notice extends State<Notice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}

// ignore_for_file: deprecated_member_use, unused_field

import 'package:flutter/material.dart';

import 'package:donut/src/constants.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({Key? key}) : super(key: key);

  @override
  _DonatePage createState() => _DonatePage();
}

class _DonatePage extends State<DonatePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('donate page'),
        backgroundColor: kPrimaryColor,
      ),
      body: const Center(
        child: Text('demand page'),
      ),
    );
  }
}

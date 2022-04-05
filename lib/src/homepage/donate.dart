// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

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
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.white, Colors.pink]),
          ),
        ),
      ),
      body: const Center(
        child: Text('demand page'),
      ),
    );
  }
}

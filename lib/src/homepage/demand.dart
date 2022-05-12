import 'package:flutter/material.dart';

import 'package:donut/src/constants.dart';

class DemandPage extends StatefulWidget {
  const DemandPage({Key? key}) : super(key: key);

  @override
  _DemandPageState createState() => _DemandPageState();
}

class _DemandPageState extends State<DemandPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('demand page'),
        backgroundColor: kPrimaryColor,
      ),
      body: const Center(
        child: Text('demand page'),
      ),
    );
  }
}

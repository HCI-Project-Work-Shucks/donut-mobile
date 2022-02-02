import 'package:flutter/material.dart';

class DemandPage extends StatefulWidget {
  const DemandPage({Key? key}) : super(key: key);

  @override
  _DemandPageState createState() => _DemandPageState();
}

class _DemandPageState extends State<DemandPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('demand page'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.white, Colors.pink]),
          ),
        ),
      ),
      body: new Center(
        child: new Text('demand page'),
      ),
    );
  }
}

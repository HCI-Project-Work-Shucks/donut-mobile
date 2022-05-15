// ignore_for_file: deprecated_member_use, unused_field

import 'package:flutter/material.dart';

import 'package:donut/src/constants.dart';
import 'add_item_demand.dart';
import 'package:donut/src/models/tests/items.dart';

class DemandPage extends StatefulWidget {
  const DemandPage({Key? key}) : super(key: key);

  @override
  _DemandPage createState() => _DemandPage();
}

class _DemandPage extends State<DemandPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('donate page'),
        backgroundColor: kPrimaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Demand page',
            ),
            Text(
              'Hi',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddItemDemand()),
          );
        },
        tooltip: 'Add item that you want to donate',
        child: const Icon(Icons.add),
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}

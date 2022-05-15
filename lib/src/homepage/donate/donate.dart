// ignore_for_file: deprecated_member_use, unused_field

import 'package:flutter/material.dart';

import 'package:donut/src/constants.dart';
import 'add_item_donate.dart';
import 'package:donut/src/models/tests/items.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Donate page',
            ),
            Text(
              'HI',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddItemDonate()),
          );
        },
        tooltip: 'Add item that you want to donate',
        child: const Icon(Icons.add),
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
